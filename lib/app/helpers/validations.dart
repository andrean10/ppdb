import 'package:get/get.dart';

abstract class Validation {
  static String? formField({
    required String titleField,
    required String? value,
    bool isNumericOnly = false,
    bool isEmail = false,
    bool isNotZero = false,
    num minLength = 0,
    String? messageEmpty,
    String? messageMinChar,
  }) {
    if (value != null) {
      if (value.isEmpty) {
        return '$titleField harus di isi!';
      }

      if (isNumericOnly) {
        if (!value.isNumericOnly) {
          return messageEmpty ?? 'Inputan $titleField harus berupa angka!';
        }

        if (isNotZero) {
          if (int.parse(value) == 0) {
            return 'Nilai field harus lebih dari 0';
          }
        }
      }

      if (isEmail) {
        if (!value.isEmail) {
          return 'Format $titleField tidak sesuai';
        }
      }

      if (value.length.isLowerThan(minLength)) {
        return messageMinChar ??
            '$titleField minimal harus $minLength karakter!';
      }
    }
    return null;
  }
}
