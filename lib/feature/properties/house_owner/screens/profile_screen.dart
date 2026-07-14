import 'package:flutter/material.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';
import 'package:propertie_explore/feature/auth/screens/login_screen.dart';
import 'package:propertie_explore/feature/auth/services/auth_services.dart';
import 'package:propertie_explore/feature/properties/house_owner/services/services.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PropertyServices propertyServices = PropertyServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ProfileScreen"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),

      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade100, Colors.green.shade500],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
              bottom: 200,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),

                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 55, color: Colors.green),
                ),

                const SizedBox(height: 15),

                const Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 35),

                FutureBuilder(
                  future: propertyServices.userFetching(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: Colors.green),
                      );
                    }
                    if (!snapshot.hasData) {
                      return Center(child: Text("SomeThing Wrong!"));
                    }

                    final data = snapshot.data!;

                    return Column(
                      children: [
                        AppTextformField(
                          readOnly: true,
                          hintText: data.name,
                          prefixIcon: Icons.person,
                        ),

                        const SizedBox(height: 18),

                        AppTextformField(
                          readOnly: true,
                          hintText: data.email,
                          prefixIcon: Icons.email,
                        ),

                        const SizedBox(height: 18),

                        AppTextformField(
                          readOnly: true,
                          hintText: data.role,
                          prefixIcon: Icons.badge,
                        ),

                        const SizedBox(height: 18),

                        AppTextformField(
                          readOnly: true,
                          hintText: data.createdAt!.toDate().toString(),
                          prefixIcon: Icons.calendar_today,
                        ),

                        const SizedBox(height: 40),
                        AppElevatedButton(
                          ButtonText: "Logout",
                          width: 370,
                          height: 60,
                          ContainerColor: Colors.green.shade700,
                          borderRadius: 10,
                          TextColor: Colors.white,
                          fontSize: 20,
                          onPressed: () async {
                            AuthFireBaseServices auth = AuthFireBaseServices();

                            await auth.userLogout();

                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (_) => LoginScreen()),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
