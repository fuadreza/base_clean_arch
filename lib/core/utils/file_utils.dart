import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:base_clean_arch/core/extensions/string_extension.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart' as vt;

class FileUtils {
  /// Pick Image From Gallery
  ///
  /// User pick image from gallery and returns [File].
  /// Return null if user not picking any image
  static Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }

  /// Pick Video From Gallery
  ///
  /// User pick video from gallery and returns [File].
  /// Return null if user not picking any video
  static Future<File?> pickVideoFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(minutes: 5),
    );
    if (pickedFile == null) return null;
    return File(pickedFile.path);
  }

  /// Read File
  ///
  /// Return [File] based on inputted file [path],
  /// return null if file not exist.
  static Future<File?> readFile(String path) async {
    final file = File(path);

    if (await file.exists()) {
      return file;
    }

    return null;
  }

  /// Get Thumbnail Video
  ///
  /// Return [File] image from file video
  /// return null if file not exist.
  static Future<Uint8List?> getThumbnailFromVideo(String path) async {
    final file = File(path);

    if (await file.exists()) {
      final Uint8List? uInt8list = await vt.VideoThumbnail.thumbnailData(
        video: file.path,
        imageFormat: vt.ImageFormat.JPEG,
        maxWidth: 128,
        quality: 50,
      );
      return uInt8list;
    }

    return null;
  }


  /// Returns the application support directory path as a [String].
  ///
  /// This directory is suitable for storing files that are not user data and should
  /// persist between app launches, such as configuration files or cached data.
  ///
  /// Example:
  /// ```dart
  /// final path = await FileUtils.getAppSupportDirectoryPath();
  /// print('App support directory: \$path');
  /// ```
  static Future<String> getAppSupportDirectoryPath() async {
    final directory = await getApplicationSupportDirectory();
    return directory.path;
  }

  /// Get Local File Path
  ///
  /// Return [String] based on inputted file [filename]
  static Future<String?> getLocalFilePath(String filename) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$filename';
    return path;
  }

  /// Get Local File
  ///
  /// Return [File] based on inputted file [filename]
  static Future<File?> getLocalFile(String filename) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/$filename';

    final file = await readFile(path);

    return file;
  }

  /// Save Photo to Local
  ///
  /// Accept [File] and save it to local customized path
  /// using [DateTime] for naming file
  static Future<String> saveFile(File? file) async {
    bool isFileExisted = await file?.exists() ?? false;
    if (file != null && isFileExisted) {
      final dir = await getApplicationDocumentsDirectory();
      final path = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final savedFile = await file.copy(path);
      if (file.path.containsIgnoreCase('cache')) {
        await deleteFile(file.path, deleteParent: true);
      }
      return savedFile.path;
    } else {
      return 'error';
    }
  }

  /// Overwrite File with new File
  ///
  /// Accept [oldFilePath] and read that into [File]
  /// and save a new file in [newFile]
  static Future<String> overwriteFile(String oldFilePath, File newFile) async {
    await deleteFile(oldFilePath);
    return saveFile(newFile);
  }

  /// Delete File
  ///
  /// Accept [filePath] and read that into [File]
  /// then delete that file if exist
  static Future<String> deleteFile(String filePath, {bool recursive = false, bool deleteParent = false}) async {
    final File? existingFile = await readFile(filePath);
    if (existingFile != null) {
      final bool isFileExist = await existingFile.exists();
      if (isFileExist) {
        if (deleteParent) {
          existingFile.parent.delete(recursive: deleteParent);
        } else {
          existingFile.delete(recursive: recursive);
        }
      }
    }
    return filePath;
  }

  /// Delete Batch File by Path
  ///
  /// Accept [listPath] and loop for every item in that list
  /// then delete that file if exist one by one
  static Future<void> deleteFilesByListPath(List<String> listPath, {deleteParent = false}) async {
    for (int i = 0; i < listPath.length; i++) {
      await deleteFile(listPath[i], deleteParent: deleteParent);
    }
  }

  /// Extract Image from base64 String
  ///
  /// Receive [base64Image] and convert it to [Image] with optional
  /// value for resize and quality
  static Image? extractAndResizeImageFromBase64(
    String base64Image, {
    int width = 300,
    int quality = 50,
  }) {
    final String extractedBase64 = base64Image.extractBase64();
    if (extractedBase64.isNotEmpty) {
      final List<int> byteData = base64.decode(extractedBase64);
      Uint8List uint8listImages = Uint8List.fromList(byteData);
      final Image? image = decodeImage(uint8listImages);
      if (image != null) {
        List<int> compressedBytes = encodeJpg(image, quality: quality);
        Image? imageCompressed = decodeImage(Uint8List.fromList(compressedBytes));
        if (imageCompressed != null) {
          Image imageResize = copyResize(imageCompressed, width: width);
          return imageResize;
        }
      }
    }
    return null;
  }

  /// Split Data into Chunks
  ///
  /// This method takes a [Uint8List] and splits it into smaller chunks of a specified size.
  /// - Parameters:
  ///   - [data] -> The `Uint8List` to be split.
  ///   - [chunkSize] -> The size of each chunk. Default is 256.
  /// - Returns: A list of [Uint8List] chunks.
  static List<Uint8List> splitData(
    Uint8List data, {
    int chunkSize = 256,
  }) {
    List<Uint8List> chunks = [];
    for (int i = 0; i < data.length; i += chunkSize) {
      int end = (i + chunkSize < data.length) ? i + chunkSize : data.length;
      chunks.add(data.sublist(i, end));
    }
    return chunks;
  }
}
