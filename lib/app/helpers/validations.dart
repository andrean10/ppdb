import 'package:get/get.dart';

abstract class Validation {
  static String? formField({
    required String titleField,
    required String? value,
    isNumericOnly = false,
    isEmail = false,
    num minLength = 0,
  }) {
    if (value != null) {
      if (value.isEmpty) {
        return '$titleField harus di isi!';
      }

      if (isNumericOnly) {
        if (!value.isNumericOnly) {
          return 'Inputan $titleField harus berupa angka!';
        }
      }

      if (isEmail) {
        if (!value.isEmail) {
          return '$titleField harus berupa email';
        }
      }

      if (value.length.isLowerThan(minLength)) {
        return '$titleField minimal harus $minLength karakter!';
      }
    }
    return null;
  }
}
