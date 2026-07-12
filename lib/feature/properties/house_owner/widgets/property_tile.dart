import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/house_owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/house_owner/screens/update_screen.dart';
import 'package:propertie_explore/feature/properties/house_owner/services/services.dart';

class PropertyOwnerTile extends StatelessWidget {
  const PropertyOwnerTile({super.key, required this.property});

  final PropertieModel property;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          Container(
            height: 220,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Icon(Icons.image, size: 70, color: Colors.grey.shade700),
          ),

          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${property.title}",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.person, size: 18),
                    SizedBox(width: 6),
                    Text(
                      "Published by: ${property.ownerName}",
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    SizedBox(width: 5),

                    Text(
                      "Rs ${property.price}.00",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                Divider(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(Icons.square_foot),
                        SizedBox(height: 5),
                        Text("${property.area} Marla"),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icons.home_work),
                        SizedBox(height: 5),
                        Text("${property.propertyType}"),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icons.bed),
                        SizedBox(height: 5),
                        Text("${property.bed} Beds"),
                      ],
                    ),

                    Column(
                      children: [
                        Icon(Icons.bathtub),
                        SizedBox(height: 5),
                        Text("${property.bath} Baths"),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 25),

                Text(
                  "Location",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Row(
                  children: [
                    Icon(Icons.location_on, color: Colors.red),
                    SizedBox(width: 5),
                    Expanded(child: Text("${property.location}")),
                  ],
                ),

                SizedBox(height: 25),

                Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 8),

                Text("${property.description}"),

                SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    UpdatePropertyScreen(property: property),
                              ),
                            );
                          },
                          icon: const Icon(Icons.edit_rounded, size: 20),
                          label: const Text(
                            "Edit Property",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.blue.shade600,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: SizedBox(
                        height: 54,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            PropertyServices().deleteProperty(id: property.id!);
                          },
                          icon: const Icon(
                            Icons.delete_forever_rounded,
                            size: 20,
                          ),
                          label: const Text(
                            "Delete",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.red.shade500,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15), //
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
