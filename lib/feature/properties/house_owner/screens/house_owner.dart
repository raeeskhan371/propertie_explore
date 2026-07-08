import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/add_propertie.dart';

class HouseOwner extends StatefulWidget {
  const HouseOwner({super.key});

  @override
  State<HouseOwner> createState() => _HouseOwnerState();
}

class _HouseOwnerState extends State<HouseOwner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("House Owner"), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            (MaterialPageRoute(builder: (_) => AddPropertie())),
          );
        },
      ),
    );
  }
}
