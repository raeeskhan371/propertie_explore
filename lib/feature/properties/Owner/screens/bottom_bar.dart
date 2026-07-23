import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/Owner/screens/AddPropertyScreen.dart';
import 'package:propertie_explore/feature/properties/Owner/screens/explore_properties_screen.dart';
import 'package:propertie_explore/feature/properties/Owner/screens/my_properties_screen.dart';
import 'package:propertie_explore/feature/auth/screens/profile_screen.dart';

class OwnerBottomBar extends StatefulWidget {
  const OwnerBottomBar({super.key});

  @override
  State<OwnerBottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<OwnerBottomBar> {
  int index = 0;
  void onChangeTap(int inde) {
    setState(() {
      index = inde;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      MyPropertiesScreen(),
      ExplorePropertiesScreen(),
      AddPropertyScreen(
        onPropertyAdd: () {
          onChangeTap(0);
        },
      ),
      ProfileScreen(),
    ];
    return Scaffold(
      body: screens[index],

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,

        currentIndex: index,

        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work_outlined),
            activeIcon: Icon(Icons.home_work),
            label: "My Properties",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: "Add Property",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
