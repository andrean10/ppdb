import 'dart:io';
import 'dart:math';

import 'package:get/get_utils/get_utils.dart';
import 'package:logger/logger.dart';

class FileHelper {
  static final _logger = Logger();

  static Future<double?> checkFileSizeBasedOnMB(File file) async {
    try {
      final int sizeInBytes = await file.length();
      final double sizeInKB = sizeInBytes / 1024;
      final double sizeInMB = sizeInKB / 1024;

      _logger.d('debug: file size MB = $sizeInMB');

      return sizeInMB;
    } catch (e) {
      _logger.e('Error: ', error: e);
    }
    return null;
  }

  static String checkExtension(String path) {
    final randomTime = DateTime.now().toIso8601String();

    if (GetUtils.isPDF(path)) {
      return '$randomTime.pdf';
    } else {
      final split = path.split('.');
      final extension = split.last;
      return '$randomTime.$extension';
    }
  }

  static String generateRandomFileName({
    required String uniqueNameFile,
    required String ext,
  }) {
    final random = Random();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final randomNum = random.nextInt(10000); // Generate a random number
    return '$timestamp-${randomNum}_$uniqueNameFile.$ext';
  }
}
