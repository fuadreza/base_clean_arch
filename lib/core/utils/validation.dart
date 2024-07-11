import 'package:meta_validator/meta_validator.dart';

class Validation {
  static String? validateNotNull(String? value, fieldName) {
    if (value == '') {
      return '$fieldName tidak boleh kosong';
    } else {
      return null;
    }
  }

  static bool checkDayIsApplied(int dayApplied) {
    const arr = [64, 32, 16, 8, 4, 2, 1];
    DateTime currentDate = DateTime.now();
    List<int> arrApplied = [];
    List<int> dayOfWeek = [];
    for (var i = 0; i < arr.length; i++) {
      if (dayApplied - arr[i] < 0) {
        continue;
      } else if (dayApplied - arr[i] == 0) {
        arrApplied.add(arr[i]);
        break;
      } else {
        arrApplied.add(arr[i]);
        dayApplied -= arr[i];
      }
    }
    for (var i = 0; i < arrApplied.length; i++) {
      switch (arrApplied[i]) {
        case 64:
          dayOfWeek.add(7);
          break;
        case 32:
          dayOfWeek.add(6);
          break;
        case 16:
          dayOfWeek.add(5);
          break;
        case 8:
          dayOfWeek.add(4);
          break;
        case 4:
          dayOfWeek.add(3);
          break;
        case 2:
          dayOfWeek.add(2);
          break;
        case 1:
          dayOfWeek.add(1);
          break;
        default:
          break;
      }
    }
    if (dayOfWeek.any((element) => element == currentDate.weekday)) {
      return true;
    } else {
      return false;
    }
  }

  String? validateEmail(String? email) {
    String? validation = validateNotNull(email, 'Email');
    validation ??= StringValidator.validateEmail(email!) ? null : 'Format email salah';
    return validation;
  }

  String? validatePhoneNumber(String? phone) {
    String? validation = validateNotNull(phone, 'Telepon');
    validation ??= StringValidator.validatePhone(phone!) ? null : 'Format telepon salah';
    return validation;
  }
}
