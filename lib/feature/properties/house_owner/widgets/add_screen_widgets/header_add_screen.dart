import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderAddScreen extends StatelessWidget {
  const HeaderAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },

              child: Icon(Icons.arrow_back_sharp, size: 20),
            ),
          ),
        ),
        Text(
          "Add Property",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(child: Icon(Icons.home, size: 20)),
          ),
        ),
      ],
    );
  }
}
