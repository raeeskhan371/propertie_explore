import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';
import 'package:propertie_explore/feature/auth/screens/login_screen.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confrimPasswordController = TextEditingController();
  String SelectedRole = "Select Role";
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
                  controller: nameController,
                  hintText: "Full Name",
                  prefixIcon: Icons.person,
                ),
                const SizedBox(height: 15),
                AppTextformField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: Icons.email,
                ),
                const SizedBox(height: 15),
                AppTextformField(
                  controller: passwordController,
                  hintText: "Create Your Password",
                  suffix: Icons.visibility,
                ),
                const SizedBox(height: 15),
                AppTextformField(
                  controller: confrimPasswordController,
                  hintText: "Confirm Your Password",
                  suffix: Icons.visibility,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  elevation: 1,
                  items: [
                    DropdownMenuItem(
                      value: "customer",
                      child: Text("Customer"),
                    ),
                    DropdownMenuItem(
                      value: "houseOwner",
                      child: Text("HouseOwer"),
                    ),
                  ],
                  onChanged: (value) {
                    SelectedRole = value!;
                    print(SelectedRole);
                  },
                ),

                SizedBox(height: 10),
                AppElevatedButton(
                  ButtonText: "SingUp",
                  width: 380,
                  height: 50,
                  ContainerColor: Colors.blue,
                  borderRadius: 10,
                  TextColor: Colors.white,
                  fontSize: 20,
                  onPressed: () {
                    // These prints Are For Cheacking the TextFields and Selcted Role
                    print("Singup Button Pressed Button Presssed");
                    print("${nameController.text}");
                    print("${emailController.text}");
                    print("${passwordController.text}");
                    print("${confrimPasswordController.text}");
                    print("$SelectedRole");
                    AuthFireBaseServices user = AuthFireBaseServices();
                    user.userSinup(
                      name: nameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      role: SelectedRole,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
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
