import 'package:flutter/material.dart';

class PropertyFeed extends StatefulWidget {
  const PropertyFeed({super.key});

  @override
  State<PropertyFeed> createState() => _PropertyFeedState();
}

class _PropertyFeedState extends State<PropertyFeed> {
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

            const Text(
              "Luxury Family House",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    "Hayatabad, Peshawar",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            const Text(
              "Rs. 8,500,000",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(Icons.bed, color: Colors.green),
                          SizedBox(height: 8),
                          Text("4 Beds"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(Icons.bathtub, color: Colors.green),
                          SizedBox(height: 8),
                          Text("3 Baths"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          Icon(Icons.square_foot, color: Colors.green),
                          SizedBox(height: 8),
                          Text("10 Marla"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: Icon(Icons.home_work, color: Colors.green),
                title: Text("Property Type"),
                subtitle: Text("House"),
              ),
            ),

            const SizedBox(height: 12),

            Card(
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person)),
                title: Text("Owner"),
                subtitle: Text("Muhammad Raees"),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Description",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text(
              "This beautiful luxury family house is located in Hayatabad, "
              "Peshawar. It has spacious bedrooms, modern bathrooms, a large "
              "drawing room, TV lounge, car parking, and a beautiful lawn. "
              "The property is close to schools, hospitals, and shopping malls.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            const SizedBox(height: 20),

            Card(
              child: ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.green),
                title: Text("Posted On"),
                subtitle: Text("13 July 2026"),
              ),
            ),

            const SizedBox(height: 30),

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
