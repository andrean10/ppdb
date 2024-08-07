import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? icon;
  final Widget child;
  final ButtonStyle? style;
  final VoidCallback? onPressed;
  final bool state;

  const CustomOutlinedButton({
    super.key,
    this.width,
    this.height,
    this.icon,
    required this.child,
    this.style,
    this.onPressed,
    this.state = false,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      width: width,
      height: height ?? size.height * 0.055,
      child: (icon != null)
          ? OutlinedButton.icon(
              onPressed: onPressed,
              icon: icon!,
              label: child,
              style: style,
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: style,
              child: (state)
                  ? SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: CircularProgressIndicator(
                        color: colors.primary,
                      ),
                    )
                  : child,
            ),
    );
  }
}
