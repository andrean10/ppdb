import 'package:flutter/material.dart';
import 'custom_card.dart';

class Cards {
  static Widget elevated({
    EdgeInsets? padding,
    required Widget child,
    Clip? clip,
  }) {
    return CustomCard(padding: padding, child: child);
  }

  static Widget filled({
    required BuildContext context,
    EdgeInsets? padding,
    Clip? clip,
    required Widget child,
    ShapeBorder? shape,
    Color? color,
  }) {
    return CustomCard(
      elevation: 0,
      padding: padding,
      shape: shape,
      color: color ?? Theme.of(context).colorScheme.surfaceContainerHighest,
      child: child,
    );
  }

  static Widget outlined({
    required BuildContext context,
    EdgeInsets? padding,
    Clip? clip,
    required Widget child,
    Color? color,
  }) {
    return CustomCard(
      padding: padding,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      // color: color,
      child: child,
    );
  }
}
