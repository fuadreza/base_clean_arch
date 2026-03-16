import 'dart:ui';

import 'package:base_clean_arch/core/utils/validation.dart';
import 'package:intl/intl.dart';

extension StringExtension on String? {
  /// Check if string is null or blank
  bool isBlank() {
    if (this == null) {
      return true;
    } else {
      if (this!.isEmpty) {
        return true;
      } else {
        return false;
      }
    }
  }

  /// Convert Html format to string format
  String convertHtmlToString() {
    if (this != null) {
      String data = this!;
      return Bidi.stripHtmlIfNeeded(data);
    } else {
      return '';
    }
  }

  /// Convert string to format currency in rupiah
  String convertToRupiah({int? decimal = 0}) {
    if (this != null) {
      // delete .0000
      String value = this!;
      String clean = value.replaceZero4();
      // create convert rupiah
      final formatRupiah = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: decimal);
      // convert to rupiah
      final rupiah = formatRupiah.format(double.parse(clean));

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  /// Extract Any String Rupiah and return only number
  ///
  /// Example: Rp 100.000 will return 100000
  double convertRupiahToDouble() {
    if (this != null) {
      final List<String> split = this!.split(',');
      return double.tryParse(split.first.replaceAll('.', '').replaceAll('Rp', '').replaceAll(' ', '')) ?? 0;
    } else {
      return 0;
    }
  }

  /// Replace four zero decimal from server
  /// to basic format without decimal
  String replaceZero4() {
    if (this != null) {
      return this!.replaceAll('.0000', '');
    } else {
      return '0';
    }
  }

  /// Replace any pattern to empty string
  String replaceZero(String pattern) {
    if (this != null) {
      return this!.replaceAll(pattern, '');
    } else {
      return '';
    }
  }

  /// Convert String to Rupiah format
  String convertToRupiahInt() {
    if (this != null) {
      // create convert rupiah
      final formatRupiah = NumberFormat.simpleCurrency(locale: 'id_ID', decimalDigits: 0);
      // convert to rupiah
      final rupiah = formatRupiah.format(double.parse(this!));

      return rupiah;
    } else {
      return 'Rp.0';
    }
  }

  /// Get first character of word(s)
  String? getFirstWordOfTitle({int countWord = 2}) {
    if (this != null) {
      List<String> splitWord = this!.split(' ');
      String initial = '';
      int countedWord = 0;
      for (var i = 0; i < splitWord.length; i++) {
        if (countedWord < countWord) {
          if (splitWord[i].isNotEmpty) {
            countedWord++;
            initial += splitWord[i].substring(0, 1);
          }
        } else {
          break;
        }
      }
      String name = initial.toUpperCase();
      return name;
    } else {
      return '';
    }
  }

  /// Check whether words contains any keyword
  /// ignoring any case
  bool containsIgnoreCase(String? keyword) {
    if (this == null) {
      return false;
    } else {
      if (keyword == null) {
        return false;
      } else {
        return this!.toLowerCase().contains(keyword.toLowerCase());
      }
    }
  }

  /// Check whether words equals some keyword
  /// ignoring any case
  bool equalsIgnoreCase(String? keyword) {
    if (this == null) {
      return false;
    } else {
      if (keyword == null) {
        return false;
      } else {
        return this!.toLowerCase() == keyword.toLowerCase();
      }
    }
  }

  /// Split string based on length of character
  /// [lengthSplit] and return list of String
  List<String> stringSplitter(int lengthSplit) {
    if (this == null) {
      return [];
    } else {
      List<String> listString = this!.split(' ');
      List<String> newListString = [];
      if (listString.isNotEmpty) {
        String tempString = listString[0];
        for (int i = 0; i < listString.length; i++) {
          if (i < (listString.length - 1)) {
            final int lengthString = 1 + tempString.length + listString[i + 1].length;
            if (lengthString <= lengthSplit) {
              tempString += ' ${listString[i + 1]}';
            } else {
              newListString.add(tempString);
              if (i < (listString.length - 1)) {
                tempString = listString[i + 1];
              }
            }
          } else {
            newListString.add(tempString);
          }
        }
      }
      return newListString;
    }
  }

  /// Extract data base64 inside string text
  /// separated by comma and return String
  String extractBase64() {
    if (this != null) {
      final List<String> splitString = this!.split(',');
      if (splitString.isNotEmpty) {
        return splitString.last;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  /// Masking email
  ///
  /// Hide all character before @ except last 2 character if (email name length >= 5)
  /// and last 1 character if (email name length < 5)
  /// Example:
  /// given input email: sample@gmail.com
  /// will return: xxxxle@gmail.com
  String maskingEmail() {
    if (this != null) {
      if (Validation().validateEmail(this) == null) {
        final List<String> splitEmail = this!.split('@');
        if (splitEmail.isNotEmpty) {
          final String firstEmail = splitEmail.first;
          final String lastEmail = splitEmail.last;
          if (firstEmail.length > 2) {
            final String normalText = firstEmail.substring((firstEmail.length - (firstEmail.length >= 5 ? 2 : 1)), firstEmail.length);
            final String maskingEmail = '${normalText.padLeft(firstEmail.length, 'x')}@$lastEmail';
            return maskingEmail;
          } else {
            return this!;
          }
        } else {
          return this!;
        }
      } else {
        return this!;
      }
    } else {
      return '';
    }
  }

  /// Masking phone number
  ///
  /// Change all character with character 'x' except 4 last character
  /// Example: 089219312524
  /// will return: xxxxxxxx2524
  String maskingPhone() {
    if (this != null) {
      final String phone = this!;
      // Change all character with character 'x' except 4 last character
      if (Validation.validatePhoneNumber(this) == null) {
        if (phone.length > 4) {
          final String normalText = phone.substring(phone.length - 4, phone.length);
          final String maskingPhone = normalText.padLeft(phone.length, 'x');
          return maskingPhone;
        } else {
          return phone;
        }
      } else {
        return phone;
      }
    } else {
      return '';
    }
  }

  /// Sanitizes a phone number and ensures it starts with the given [phoneCode].
  ///
  /// Removes all non-numeric characters, replaces a leading '0' with [phoneCode],
  /// prepends [phoneCode] if not present, and removes extra zero after [phoneCode] if needed.
  ///
  /// Example:
  /// ```dart
  /// '08123456789'.sanitizePhoneWithCode(phoneCode: '62'); // returns '628123456789'
  /// '6208123456789'.sanitizePhoneWithCode(phoneCode: '62'); // returns '628123456789'
  /// ```
  String sanitizePhoneWithCode({String phoneCode = '62'}) {
    if (this != null) {
      if (this!.length > 2) {
        String phoneWithCode = this!.replaceAll(RegExp(r'[^0-9]'), '');
        // Only replace leading '0' with phoneCode
        if (phoneWithCode.startsWith('0')) {
          phoneWithCode = phoneWithCode.replaceFirst(RegExp(r'^0'), phoneCode);
        }
        // If not already starts with phoneCode, prepend it
        if (!phoneWithCode.startsWith(phoneCode)) {
          phoneWithCode = '$phoneCode$phoneWithCode';
        }
        // Remove extra zero after phoneCode if present (e.g., 6208123 -> 628123)
        if (phoneWithCode.startsWith('${phoneCode}0')) {
          phoneWithCode = phoneCode + phoneWithCode.substring(phoneCode.length + 1);
        }
        return phoneWithCode;
      } else {
        return this!;
      }
    } else {
      return '';
    }
  }

  bool isNumeric() {
    if (this == null) {
      return false;
    }
    return double.tryParse(this!) != null;
  }

  /// Checks if the string is a valid IPv4 address.
  ///
  /// Returns `true` if the string is a valid IPv4 address (e.g., 192.168.1.1),
  /// otherwise returns `false`.
  bool isValidIpAddress() {
    if (this == null) {
      return false;
    }
    final parts = this!.split('.');
    if (parts.length != 4) return false;
    for (final part in parts) {
      if (part.isEmpty || part.length > 3) return false;
      final numValue = int.tryParse(part);
      if (numValue == null || numValue < 0 || numValue > 255) return false;
      if (!RegExp(r'^\d+$').hasMatch(part)) return false;
    }
    return true;
  }

  (String, int)? extractIpAndPort() {
    if (this == null || this!.isBlank()) {
      return null;
    }
    final parts = this!.split(':');
    if (parts.length != 2) {
      return null;
    }
    final ip = parts[0].trim();
    final portStr = parts[1].trim();
    final port = int.tryParse(portStr);
    if (port == null || port < 0 || port > 65535) {
      return null;
    }
    return (ip, port);
  }

  String excludeJubelioStore() {
    if (this != null) {
      final String storeName = this!;
      if (storeName.toLowerCase().contains('jubelio store')) {
        var store = storeName.replaceAll('JUBELIO STORE', '');
        // Remove ' ' on first character if exists
        if (store.startsWith(' ')) {
          store = store.substring(1).trim();
        }
        // Remove '-' on first character if exists
        if (store.startsWith('-')) {
          store = store.substring(1).trim();
        }
        // Remove ' ' on first character if exists
        if (store.startsWith(' ')) {
          store = store.substring(1).trim();
        }
        return store;
      } else {
        return storeName;
      }
    } else {
      return '';
    }
  }


  /// Checks if the string is a valid URL starting with http:// or https://.
  ///
  /// Returns `true` if the string matches the URL pattern, otherwise returns `false`.
  ///
  /// Example:
  /// ```dart
  /// 'https://example.com'.isValidUrl(); // returns true
  /// 'ftp://example.com'.isValidUrl(); // returns false
  /// ```
  bool isValidUrl() {
    if (this == null) {
      return false;
    }
    const urlPattern = r'^(http:\/\/|https:\/\/).+';
    final result = RegExp(urlPattern, caseSensitive: false).hasMatch(this!);
    return result;
  }

  /// Converts a hex string to a [Color] object.
  ///
  /// Supports short hex format (e.g., `#fff` → `#ffffff`).
  /// Prepends full opacity (`ff`) if no alpha channel is provided.
  /// Ignores the leading `#` if present.
  ///
  /// Example:
  /// ```dart
  /// Color white  = '#ffffff'.toColor();   // → Color(0xffffffff)
  /// Color black  = '#000000'.toColor();   // → Color(0xff000000)
  /// Color red    = '#f00'.toColor();      // → Color(0xffff0000) (short hex)
  /// Color custom = '#80ff5733'.toColor(); // → Color(0x80ff5733) (with alpha)
  /// ```
  Color toColor() {
    if (this != null) {
      final buffer = StringBuffer();
      final hex = this!.replaceAll('#', '').trim();

      // Support short hex (#fff → #ffffff)
      final expanded = hex.length == 3 ? hex.split('').map((c) => '$c$c').join() : hex;

      // Prepend full opacity (ff) if no alpha channel provided
      buffer.write(expanded.length == 6 ? 'ff' : '');
      buffer.write(expanded);

      return Color(int.parse(buffer.toString(), radix: 16));
    } else {
      return const Color(0x00000000); // Return transparent color for null input
    }
  }

  /// Removes the phone number prefix if it starts with '0' or '62' or '+62'.
  ///
  /// Returns the phone number without the leading '0' or '62' or '+62'.
  /// If the string is null, returns an empty string.
  String removePhonePrefix() {
    if (this != null) {
      String phone = this!;
      if (phone.startsWith('0')) {
        return phone.substring(1);
      } else if (phone.startsWith('62')) {
        return phone.substring(2);
      } else if (phone.startsWith('+62')) {
        return phone.substring(3);
      } else {
        return phone;
      }
    } else {
      return '';
    }
  }
}
