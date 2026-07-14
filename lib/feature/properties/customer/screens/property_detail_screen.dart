import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/house_owner/model/propertie_model.dart';

class PropertyDetailsScreen extends StatefulWidget {
  PropertieModel propertyData;
  PropertyDetailsScreen({super.key, required this.propertyData});

  @override
  State<PropertyDetailsScreen> createState() => _PropertyDetailsScreenState();
}

class _PropertyDetailsScreenState extends State<PropertyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Property Details"), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property Image
            Container(
              height: 220,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(Icons.home, size: 80, color: Colors.grey),
            ),

            const SizedBox(height: 20),

            // Title
            Text(
              widget.propertyData.title,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Location
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    widget.propertyData.location,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Price
            Text(
              widget.propertyData.price.toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Bed Bath Area
            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      child: Column(
                        children: [
                          Icon(Icons.bed, color: Colors.green, size: 30),
                          SizedBox(height: 8),
                          Text(
                            widget.propertyData.bed.toString(),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Column(
                        children: [
                          Icon(Icons.bathtub, color: Colors.green, size: 30),
                          SizedBox(height: 8),
                          Text(
                            widget.propertyData.bath.toString(),

                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18),
                      child: Column(
                        children: [
                          Icon(
                            Icons.square_foot,
                            color: Colors.green,
                            size: 30,
                          ),
                          SizedBox(height: 8),
                          Text(
                            widget.propertyData.area.toString(),
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),

            // Property Type
            const Text(
              "Property Type",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const Icon(Icons.home_work, color: Colors.green),
                title: Text(widget.propertyData.propertyType),
              ),
            ),

            const SizedBox(height: 20),

            // Owner
            const Text(
              "Owner",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(widget.propertyData.ownerName),
              ),
            ),

            const SizedBox(height: 20),

            // Description
            const Text(
              "Description",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            const SizedBox(height: 10),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  widget.propertyData.description,
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Posted Date
            Card(
              child: ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.green),
                title: const Text("Posted On"),
                subtitle: Text(
                  widget.propertyData.createdAt!.toDate().toString(),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Contact Button
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Contact Owner",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
