import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/house_owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/house_owner/services/services.dart';
import 'package:propertie_explore/feature/properties/house_owner/widgets/property_tile.dart';

class MyPropertiesScreen extends StatefulWidget {
  const MyPropertiesScreen({super.key});

  @override
  State<MyPropertiesScreen> createState() => _MyPropertiesScreenState();
}

class _MyPropertiesScreenState extends State<MyPropertiesScreen> {
  PropertyServices OwnerProperties = PropertyServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("House Owner Dashboard"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder<List<PropertieModel>>(
        stream: OwnerProperties.fetchingOwnerProperties(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No Property Found"));
          }

          final data = snapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final property = data[index];
              return PropertyOwnerTile(property: property);
            },
          );
        },
      ),
    );
  }
}
