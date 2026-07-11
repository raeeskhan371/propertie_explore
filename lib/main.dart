import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/screens/login_screen.dart';
<<<<<<< Updated upstream
=======
import 'package:propertie_explore/feature/auth/screens/singup_screen.dart';
import 'package:propertie_explore/feature/auth/screens/splash_screen.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/AddPropertyScreen.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/bottom_bar.dart';
>>>>>>> Stashed changes
import 'package:propertie_explore/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return MaterialApp(
      title: 'Propertie Explore',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: LoginScreen(),
    );
=======
    return MaterialApp(title: 'Propertie Explore', home: SingupScreen());
>>>>>>> Stashed changes
  }
}
