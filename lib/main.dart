import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/auth/provider/auth_provider.dart';
import 'package:propertie_explore/feature/auth/screens/splash_screen.dart';
import 'package:propertie_explore/feature/properties/Owner/owner_services/owner_notification_services.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:propertie_explore/firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  OwnerNotificationServices notification = OwnerNotificationServices();

  await notification.initNotification();
  await notification.intialazationLocalNotification();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => OwnerPropertyProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Propertie Explore',
      home: SplashScreen(),
    );
  }
}
