import 'package:flutter/material.dart';

class SocmedModel {
  final Image icons;
  final String title;
  final Function() onPressed;

  SocmedModel({
    required this.icons,
    required this.title,
    required this.onPressed,
  });
}
