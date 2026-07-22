import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:provider/provider.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
        ),

        title: Text(
          "Property Detail",
          style: GoogleFonts.poppins(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
          ),
        ),
        child: Container(
          height: 650,
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
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "${widget.propertyData.profileImageUrl}",
                          ),
                        ),
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
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text("${widget.propertyData.location}"),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 8),

                    Text("${widget.propertyData.description}"),
                    SizedBox(height: 10),
                    AppElevatedButton(
                      width: 370,
                      height: 60,
                      ContainerColor: Colors.green.shade700,
                      borderRadius: 10,
                      TextColor: Colors.white,
                      fontSize: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Back",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
