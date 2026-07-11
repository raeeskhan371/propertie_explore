import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/my_properties_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Screen",
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
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 15),
                AppTextformField(
                  controller: passwordController,
                  hintText: "Enter Your Password",
                  suffix: Icons.visibility,
                ),

                const SizedBox(height: 20),
                AppElevatedButton(
                  ButtonText: "Login Screen",
                  width: 380,
                  height: 50,
                  ContainerColor: Colors.blue,
                  borderRadius: 10,
                  TextColor: Colors.white,
                  fontSize: 20,
                  onPressed: () async {
                    print("Login Button Presssed");
                    AuthFireBaseServices user = AuthFireBaseServices();
                    await user.userLogin(
                      email: emailController.text,
                      password: passwordController.text,
                      context: context,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
