import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showSnackbar({
  required String content,
  String? path,
  TextStyle? textStyle,
  required Color backgroundColor,
  Duration? duration,
}) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(
        content,
        style: textStyle ??
            Get.textTheme.labelLarge?.copyWith(
              color: Colors.white,
            ),
      ),
      backgroundColor: backgroundColor,
      duration: duration ?? 3.minutes,
      // action: (path != null)
      //     ? SnackBarAction(
      //         label: 'Lihat File',
      //         onPressed: () async {
      //           // await OpenFilex.open(path);
      //         },
      //       )
      //     : null,
    ),
  );
}
