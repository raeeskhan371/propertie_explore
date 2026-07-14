import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';

class PropertyDetailsScreen extends StatefulWidget {
  final PropertieModel propertyData;
  const PropertyDetailsScreen({super.key, required this.propertyData});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Property Details"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: 600,
        width: double.infinity,
        margin: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(2, 4),
            ),
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
                image: DecorationImage(
                  image: AssetImage("assets/images/house.jpg"),
                  fit: BoxFit.cover,
                ),
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
            ),

            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.propertyData.title}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8),

                  Row(
                    children: [
                      Icon(Icons.person, size: 18),
                      SizedBox(width: 6),
                      Text(
                        "Published by: ${widget.propertyData.ownerName}",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      SizedBox(width: 5),

                      Text(
                        "Rs ${widget.propertyData.price}",
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
                          Text("${widget.propertyData.area} Marla"),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(Icons.home_work),
                          SizedBox(height: 5),
                          Text("${widget.propertyData.propertyType}"),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(Icons.bed),
                          SizedBox(height: 5),
                          Text("${widget.propertyData.bed} Beds"),
                        ],
                      ),

                      Column(
                        children: [
                          Icon(Icons.bathtub),
                          SizedBox(height: 5),
                          Text("${widget.propertyData.bath} Baths"),
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
                      Expanded(child: Text("${widget.propertyData.location}")),
                    ],
                  ),

                  SizedBox(height: 25),

                  Text(
                    "Description",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  SizedBox(height: 8),

                  Text("${widget.propertyData.description}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
