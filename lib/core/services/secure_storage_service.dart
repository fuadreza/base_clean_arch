import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

final SecureStorageService secureStorageService = SecureStorageService.instance;

class SecureStorageService {
  static final SecureStorageService _instance = SecureStorageService();

  static SecureStorageService get instance => _instance;

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage(
    aOptions: AndroidOptions(),
  );

  final String keyToken = 'jubelioPos';
  final String boxToken = 'boxJubelioPos';

  //#region GETTER

  Future<String?> getToken() async {
    try {
      String? savedToken;

      // get token from hive
      savedToken = await getTokenHive();
      if (savedToken != null) {
        return savedToken;
      }

      savedToken = await secureStorage.read(key: keyToken);
      return savedToken;
    } catch (_) {
      return await getTokenHive();
    }
  }

  Future<String?> getTokenHive() async {
    final isBoxOpen = Hive.isBoxOpen(boxToken);
    if (isBoxOpen) {
      final Box box = Hive.box<bool>(boxToken);
      final String? savedToken = await box.get(keyToken);
      return savedToken;
    } else {
      final Box box = await Hive.openBox<bool>(boxToken);
      final String? savedToken = await box.get(keyToken);
      return savedToken;
    }
  }

  //#endregion GETTER

  //#region SETTER

  Future<void> setToken(String? token) async {
    try {
      await secureStorage.write(
        key: keyToken,
        value: token,
      );
    } catch (_) {
      await setTokenHive(token);
    }
  }

  Future<void> setTokenHive(String? token) async {
    final isBoxOpen = Hive.isBoxOpen(boxToken);
    if (isBoxOpen) {
      final Box box = Hive.box<bool>(boxToken);
      await box.put(keyToken, token);
    } else {
      final Box box = await Hive.openBox<bool>(boxToken);
      await box.put(keyToken, token);
    }
  }

  //#endregion

  //#region DELETE

  Future<void> deleteToken() async {
    try {
      await secureStorage.delete(key: keyToken);
    } catch (_) {
      await deleteTokenHive();
    }
  }

  Future<void> deleteTokenHive() async {
    final isBoxOpen = Hive.isBoxOpen(boxToken);
    if (isBoxOpen) {
      final Box box = Hive.box<bool>(boxToken);
      await box.delete(keyToken);
    } else {
      final Box box = await Hive.openBox<bool>(boxToken);
      await box.delete(keyToken);
    }
  }

//#endregion DELETE
}
