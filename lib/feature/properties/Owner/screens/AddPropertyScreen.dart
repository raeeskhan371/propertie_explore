import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/header_add_screen.dart';
import 'package:provider/provider.dart';

class AddPropertyScreen extends StatefulWidget {
  final VoidCallback onPropertyAdd;
  const AddPropertyScreen({super.key, required this.onPropertyAdd});

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
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            HeaderAddScreen(
              onBack: () {
                widget.onPropertyAdd();
              },
            ),
            SizedBox(height: 10),

            // Main Container
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,

                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFE8F5E9),
                      Color(0xFFC8E6C9),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 30,
                    ),
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
                            dropdownColor: Colors.white,
                            value: selectedPropertyType,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.home, color: Colors.green),
                              hintText: "Select Property Type",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(color: Colors.green),
                              ),
                              focusedBorder: OutlineInputBorder(),
                              focusColor: Colors.green,
                            ),
                            items: [
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

                          GestureDetector(
                            onTap: () {
                              context
                                  .read<OwnerPropertyProvider>()
                                  .pickPopertyImage();
                            },
                            child: Container(
                              height: 100,
                              width: 100,

                              color: Colors.blue,
                            ),
                          ),

                          SizedBox(height: 10),
                          Consumer<OwnerPropertyProvider>(
                            builder: (context, provider, child) {
                              return AppElevatedButton(
                                width: 380,
                                height: 50,
                                ContainerColor: Colors.green.shade700,
                                borderRadius: 10,
                                TextColor: Colors.white,
                                fontSize: 20,
                                child: provider.isLoading
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Add Property",
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),

                                onPressed: () async {
                                  try {
                                    print(provider.selectedImage?.path);
                                    await context
                                        .read<OwnerPropertyProvider>()
                                        .addProperty(
                                          ownerName: OwnerController.text,
                                          title: titleController.text,
                                          propertyType: selectedPropertyType
                                              .toString(),
                                          area: double.parse(
                                            areaController.text,
                                          ),
                                          price: double.parse(
                                            priceController.text,
                                          ),
                                          bed: int.parse(bedController.text),
                                          bath: int.parse(bathController.text),
                                          location: locationController.text,
                                          description: descController.text,
                                          imageFile: provider.selectedImage!,
                                        );

                                    widget.onPropertyAdd();
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e.toString().replaceFirst(
                                            "Exception:",
                                            "",
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
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
