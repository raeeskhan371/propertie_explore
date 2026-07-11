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
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text(
          "Singup Screen",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.home_work_rounded, size: 90, color: Colors.white),
          Text(
            "Property Explore",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            "Find Your Dream Property",
            style: TextStyle(
              color: Colors.white.withOpacity(0.9),
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 20),
          // Texfield for Use Login Singup
          Text(
            textAlign: TextAlign.center,
            "Join Property Explore to explore properties or manage your own listings with ease.",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 10),
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
                  prefixIcon: Icons.lock,
                ),
                const SizedBox(height: 15),
                AppTextformField(
                  prefixIcon: Icons.lock,
                  controller: confrimPasswordController,
                  hintText: "Confirm Your Password",
                  suffix: Icons.visibility,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  borderRadius: BorderRadius.circular(20),
                  dropdownColor: Colors.green,
                  icon: Icon(Icons.arrow_drop_down),
                  hint: Text("Property Type"),

                  elevation: 1,
                  items: [
                    DropdownMenuItem(
                      value: "customer",
                      child: Text(
                        "Client",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "houseOwner",
                      child: Text(
                        "Owner",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
