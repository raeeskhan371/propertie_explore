import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';
import 'package:propertie_explore/feature/auth/provider/auth_provider.dart';
import 'package:propertie_explore/feature/auth/screens/login_screen.dart';
import 'package:provider/provider.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confrimPasswordController.dispose();

    super.dispose();
  }

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimPasswordController =
      TextEditingController();
  String SelectedRole = "Select Role";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: SingleChildScrollView(
          child: Column(
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
                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return AppTextformField(
                          obscureText: provider.isPasswordHidden,
                          prefixIcon: Icons.lock,
                          controller: passwordController,
                          hintText: "Create Your Password",
                          suffix: IconButton(
                            onPressed: () {
                              provider.visibilityTogle();
                            },
                            icon: Icon(
                              provider.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 15),
                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return AppTextformField(
                          obscureText: provider.isPasswordHidden,
                          prefixIcon: Icons.lock,
                          controller: confrimPasswordController,
                          hintText: "Confirm Your Password",
                          suffix: IconButton(
                            onPressed: () {
                              provider.visibilityTogle();
                            },
                            icon: Icon(
                              provider.isPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
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
                      icon: Icon(
                        Icons.arrow_drop_down,
                        size: 40,
                        color: Colors.white,
                      ),
                      hint: Text(
                        "Property Type",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

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

                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return AppElevatedButton(
                          width: double.infinity,
                          height: 50,
                          ContainerColor: Colors.green.shade700,
                          borderRadius: 10,
                          TextColor: Colors.white,
                          fontSize: 20,
                          child: provider.isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "SingUp",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                          onPressed: () async {
                            // These prints Are For Cheacking the TextFields and Selcted Role
                            print("Singup Button Pressed Button Presssed");
                            print("${nameController.text}");
                            print("${emailController.text}");
                            print("${passwordController.text}");
                            print("${confrimPasswordController.text}");
                            print("$SelectedRole");

                            await context.read<AuthProvider>().userSingUp(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                              role: SelectedRole,
                            );
                            dispose();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            );
                          },
                          child: Text(
                            "Login",
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
