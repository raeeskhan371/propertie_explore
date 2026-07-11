import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/feature/auth/screens/auth_gate_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => AuthGateScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_work_rounded, size: 90, color: Colors.white),

            const SizedBox(height: 20),

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

            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}
