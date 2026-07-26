import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class OwnerNotificationServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseMessaging _messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin _plugins = FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    await requestPermistion();
    await saveFCMToken();
  }

  Future<void> requestPermistion() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('Notification Permission Accepted');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      print('Notification Permission Rejected');
    } else {
      print("Notification Permission not occur");
    }
  }

  Future<void> saveFCMToken() async {
    final String? Token = await _messaging.getToken();

    if (Token == null) {
      return debugPrint("Token Not Genereated");
    } else {
      debugPrint("Token:${Token}");
    }

    final uid = _auth.currentUser?.uid;
    await _firestore.collection("Users").doc(uid).set({
      "fcmToken": Token,
    }, SetOptions(merge: true));
    debugPrint("Token is Save In Firebase");
  }
}
