import 'package:flutter/material.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/feature/auth/screens/login_screen.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfileScreen"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: AppElevatedButton(
        ButtonText: "Logout",
        width: 370,
        height: 60,
        ContainerColor: Colors.red,
        borderRadius: 10,
        TextColor: Colors.white,
        fontSize: 20,
        onPressed: () async {
          print("Logout");
          AuthFireBaseServices auth = AuthFireBaseServices();
          await auth.userLogout();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => LoginScreen()),
          );
        },
      ),
    );
  }
}
