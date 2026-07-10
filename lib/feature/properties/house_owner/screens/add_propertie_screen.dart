import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  String? selectedPropertyType;

  TextEditingController OwnerController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController bathController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Icon(Icons.arrow_back_sharp, size: 20),
                  ),
                ),
                Text(
                  "Add Property",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Center(child: Icon(Icons.home, size: 20)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Main Container
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: SizedBox(
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: "Owner Name",
                          icon: Icons.person,
                          controller: OwnerController,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Title",
                          icon: Icons.title,
                          controller: titleController,
                        ),
                        SizedBox(height: 10),

                        //
                        DropdownButtonFormField<String>(
                          value: selectedPropertyType,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.home),
                            hintText: "Select Property Type",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.green),
                            ),
                          ),
                          items: const [
                            DropdownMenuItem(
                              value: "House",
                              child: Text("House"),
                            ),
                            DropdownMenuItem(
                              value: "Apartment",
                              child: Text("Apartment"),
                            ),
                            DropdownMenuItem(
                              value: "Plot",
                              child: Text("Plot"),
                            ),
                            DropdownMenuItem(
                              value: "Commercial",
                              child: Text("Commercial"),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              selectedPropertyType = value;
                            });
                          },
                        ),

                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Area(Marla)",
                          icon: Icons.scale,
                          controller: areaController,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Price",
                          icon: Icons.price_change,
                          controller: priceController,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Bedrooms(Bed)",
                          icon: Icons.bed,
                          controller: bedController,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Bathrooms(Bath)",
                          icon: Icons.bathroom,
                          controller: bathController,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Location",
                          icon: Icons.location_city,
                          controller: locationController,
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          hint: "Description",
                          icon: Icons.description,
                          controller: descController,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
