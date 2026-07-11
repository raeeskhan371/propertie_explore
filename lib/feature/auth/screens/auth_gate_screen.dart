import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/screens/login_screen.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';
import 'package:propertie_explore/feature/properties/customer/screens/property_overview_screen.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/bottom_bar.dart';

class AuthGateScreen extends StatefulWidget {
  const AuthGateScreen({super.key});

  @override
  State<AuthGateScreen> createState() => _AuthGateScreenState();
}

class _AuthGateScreenState extends State<AuthGateScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.hasData) {
          return FutureBuilder(
            future: AuthFireBaseServices().userCheck(),
            builder: (context, snapshot) {
              if (snapshot.data == "houseOwner") {
                return BottomBar();
              }
              return PropertyOverviewScreen();
            },
          );
        }

        return LoginScreen();
      },
    );
  }
}
