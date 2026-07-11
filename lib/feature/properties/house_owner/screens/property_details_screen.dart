import 'package:flutter/material.dart';

class PropertyFeed extends StatefulWidget {
  const PropertyFeed({super.key});

  @override
  State<PropertyFeed> createState() => _PropertyFeedState();
}

class _PropertyFeedState extends State<PropertyFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("ProfileScreen")));
  }
}
