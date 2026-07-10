import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/add_propertie.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/add_propertie_screen.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/house_owner.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/porperties_feed.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List<Widget> screens = [
    HouseOwnerDashboard(),
    AddPropertyScreen(),
    PropertyFeed(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,

        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
