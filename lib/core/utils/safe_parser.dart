import 'package:base_clean_arch/core/extensions/string_extension.dart';

class SafeParser {
  /// Parse to string with return Nullable
  ///
  /// Input dynamic [value] from json and return it string or null value
  static String? parseStringNullable(dynamic value) {
    if (value != null) {
      return value.toString();
    } else {
      return null;
    }
  }

  /// Parse to string with default value
  ///
  /// Input dynamic [value] from json and return it string or [defaultValue]
  static String parseString(dynamic value, {defaultValue = ''}) {
    if (value != null) {
      return value.toString();
    } else {
      return defaultValue;
    }
  }

  /// Parse to double with return Nullable
  ///
  /// Input dynamic [value] from json and return it double or null value
  static double? parseDoubleNullable(dynamic value) {
    try {
      if (value != null) {
        return double.parse(value.toString());
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  /// Parse to double with default value
  ///
  /// Input dynamic [value] from json and return it double or [defaultValue]
  static double parseDouble(dynamic value, {defaultValue = 0}) {
    if (value != null) {
      return double.parse(value.toString().replaceZero4());
    } else {
      return defaultValue;
    }
  }

  /// Parse to int with return Nullable
  ///
  /// Input dynamic [value] from json and return it int or null value
  static int? parseIntNullable(dynamic value) {
    if (value != null) {
      return double.parse(value.toString().replaceZero4()).toInt();
    } else {
      return null;
    }
  }

  /// Parse to int with default value
  ///
  /// Input dynamic [value] from json and return it int or [defaultValue]
  static int parseInt(dynamic value, {defaultValue = 0}) {
    if (value != null) {
      return int.parse(value.toString().replaceZero4());
    } else {
      return defaultValue;
    }
  }

  /// Parse to bool with default value
  ///
  /// Input dynamic [value] from json and return it bool or [defaultValue]
  static bool parseBool(dynamic value, {defaultValue = false}) {
    if (value != null) {
      return value;
    } else {
      return defaultValue;
    }
  }

  static List<Map<String, dynamic>> parseListMap(dynamic value) {
    if (value != null) {
      return List<Map<String, dynamic>>.from(value.whereType<Map<String, dynamic>>());
    } else {
      return [];
    }
  }
}
