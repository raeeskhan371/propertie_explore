import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final Color ContainerColor;
  final Color TextColor;

  const AppElevatedButton({
    super.key,

    required this.width,
    required this.height,
    required this.ContainerColor,
    required this.borderRadius,
    required this.TextColor,
    required this.fontSize,

    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: ContainerColor,
        ),
        child: Center(child: child),
      ),
    );
  }
}
