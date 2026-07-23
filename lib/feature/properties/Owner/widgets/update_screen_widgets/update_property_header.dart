import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePropertyHeader extends StatelessWidget {
  const UpdatePropertyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
          ),
        ),
        SizedBox(width: 75),
        Text(
          textAlign: TextAlign.center,
          "Update Property",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
