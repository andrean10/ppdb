import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerTitle extends StatelessWidget {
  final String title;

  const ContainerTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final textTheme = context.textTheme;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 6,
      ),
      child: AutoSizeText(
        title,
        style: textTheme.headlineMedium?.copyWith(
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
