import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ppdb/shared/shared_theme.dart';

class CustomSnackbar {
  static void success({
    required String title,
    required String message,
    Widget? icon = const Icon(Icons.check_rounded),
    SnackPosition? snackPosition,
  }) {
    final colorScheme = Get.theme.colorScheme;
    final bgColor = Get.isDarkMode
        ? SharedTheme.lightSuccessColor
        : SharedTheme.darkSuccessColor;

    Get.snackbar(
      title,
      message,
      backgroundColor: bgColor,
      colorText: colorScheme.surface,
      icon: icon,
      duration: 10.seconds,
      snackPosition: snackPosition ?? SnackPosition.TOP,
    );
  }

  static void error({
    required String title,
    required String message,
    Widget? icon = const Icon(Icons.error_rounded),
  }) {
    final colorScheme = Get.theme.colorScheme;

    Get.snackbar(
      title,
      message,
      backgroundColor: colorScheme.errorContainer,
      colorText: colorScheme.error,
      icon: icon,
      duration: 10.seconds,
    );
  }
}
