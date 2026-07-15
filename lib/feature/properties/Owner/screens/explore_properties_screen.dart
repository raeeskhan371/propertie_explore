import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:propertie_explore/feature/properties/Owner/screens/property_detail_screen.dart';
import 'package:propertie_explore/feature/properties/customer/services/services.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:provider/provider.dart';

class ExplorePropertiesScreen extends StatefulWidget {
  const ExplorePropertiesScreen({super.key});

  @override
  State<ExplorePropertiesScreen> createState() =>
      _ExplorePropertiesScreenState();
}

class _ExplorePropertiesScreenState extends State<ExplorePropertiesScreen> {
  CustomerServices property = CustomerServices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Property Explore",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFFFFF), Color(0xFFE8F5E9), Color(0xFFC8E6C9)],
          ),
        ),
        child: StreamBuilder<List<PropertieModel>>(
          stream: context
              .read<OwnerPropertyProvider>()
              .fetchingAllOwnerProperties(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("No Properties Found"));
            }

            final data = snapshot.data!;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final propertyItem = data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PropertyDetailsScreen(propertyData: propertyItem),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Property Image
                        Container(
                          height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: AssetImage("assets/images/house.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title & Purpose
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${propertyItem.title}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      "For Sale",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.red,
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      propertyItem.location,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              Text(
                                propertyItem.price.toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 12),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.bed_outlined, size: 18),
                                      SizedBox(width: 4),
                                      Text(
                                        "${propertyItem.bed.toString()} Beds",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.bathtub_outlined, size: 18),
                                      SizedBox(width: 4),
                                      Text(
                                        "${propertyItem.bath.toString()} Baths",
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.square_foot_outlined,
                                        size: 18,
                                      ),
                                      SizedBox(width: 4),
                                      Text("${propertyItem.area} Marla"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
