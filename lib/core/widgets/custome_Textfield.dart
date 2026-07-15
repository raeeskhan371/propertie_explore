import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextformField extends StatefulWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  final TextInputType? textInputType;
  final int? maxline;
  final bool readOnly;
  final List<TextInputFormatter>? inputformatter;
  final Widget? suffix;
  final TextCapitalization textCap;

  const AppTextformField({
    super.key,
    this.controller,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.validator,
    this.maxline,
    this.readOnly = false,
    this.inputformatter,
    this.suffix,
    this.textCap = TextCapitalization.none,
  });

  @override
  State<AppTextformField> createState() => _AppTextformFieldState();
}

class _AppTextformFieldState extends State<AppTextformField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.white,

      style: GoogleFonts.poppins(
        color: Colors.white,
        fontWeight: FontWeight.w300,
      ),
      controller: widget.controller,
      obscureText: widget.obscureText,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputformatter,
      textCapitalization: widget.textCap,

      decoration: InputDecoration(
        suffixIcon: widget.suffix,
        hintText: widget.hintText,
        hintStyle: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),

        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Icon(widget.prefixIcon, size: 22, color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
