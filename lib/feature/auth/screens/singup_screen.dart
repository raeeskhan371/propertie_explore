import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Singup Screen",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Create Your Account ",
            style: GoogleFonts.poppins(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          // Texfield for Use Login Singup
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                AppTextformField(
                  hintText: "Full Name",
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 15),
                AppTextformField(hintText: "Email", prefixIcon: Icons.email),
                const SizedBox(height: 15),
                AppTextformField(
                  hintText: "Create Your Password",
                  suffix: Icons.visibility,
                ),
                const SizedBox(height: 15),
                AppTextformField(
                  hintText: "Confirm Your Password",
                  suffix: Icons.visibility,
                ),
                const SizedBox(height: 20),
                AppElevatedButton(
                  ButtonText: "SingUp",
                  width: 380,
                  height: 50,
                  ContainerColor: Colors.blue,
                  borderRadius: 10,
                  TextColor: Colors.white,
                  fontSize: 20,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
