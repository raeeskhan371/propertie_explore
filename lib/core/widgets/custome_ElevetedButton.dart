import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  final double width;
  final double height;
  final double borderRadius;
  final double fontSize;
  final Color ContainerColor;
  final Color TextColor;
  final String ButtonText;

  const AppElevatedButton({
    super.key,
    required this.ButtonText,
    required this.width,
    required this.height,
    required this.ContainerColor,
    required this.borderRadius,
    required this.TextColor,
    required this.fontSize,
    required this.onPressed,
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
        child: Center(
          child: Text(
            ButtonText,
            style: GoogleFonts.poppins(
              color: TextColor,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
