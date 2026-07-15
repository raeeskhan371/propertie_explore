import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';
import 'package:propertie_explore/feature/auth/provider/auth_provider.dart';
import 'package:propertie_explore/feature/auth/screens/singup_screen.dart';
import 'package:propertie_explore/feature/properties/customer/screens/property_overview_screen.dart';
import 'package:propertie_explore/feature/properties/Owner/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

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
      backgroundColor: Colors.green,

      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

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

              const SizedBox(height: 50),

              Text(
                "Welcome Back! ",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),

              Text(
                "We're glad to see you again. Sign in to continue.",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
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

                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return AppTextformField(
                          obscureText: provider.isPasswordHidden,
                          prefixIcon: Icons.lock,
                          controller: passwordController,
                          hintText: "Enter Your Password",
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
                    Consumer<AuthProvider>(
                      builder: (context, provider, child) {
                        return AppElevatedButton(
                          width: 380,
                          height: 50,
                          ContainerColor: Colors.green.shade700,
                          borderRadius: 10,
                          TextColor: Colors.white,
                          fontSize: 20,
                          child: provider.isLoading
                              ? CircularProgressIndicator(color: Colors.white)
                              : Text(
                                  "Login",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                          onPressed: () async {
                            try {
                              await context.read<AuthProvider>().userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                              final role = await context
                                  .read<AuthProvider>()
                                  .userCheck();

                              if (role == "houseOwner") {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OwnerBottomBar(),
                                  ),
                                );
                              } else {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PropertyOverviewScreen(),
                                  ),
                                );
                              }
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    e.toString().replaceFirst("Exception:", ""),
                                  ),
                                ),
                              );
                            }
                          },
                        );
                      },
                    ),

                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
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
                              MaterialPageRoute(builder: (_) => SingupScreen()),
                            );
                          },
                          child: Text(
                            "SingUp",
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
