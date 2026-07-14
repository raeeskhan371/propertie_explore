import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart'
    show CustomTextField;
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:propertie_explore/feature/properties/Owner/services/owner_property_services.dart';
import 'package:provider/provider.dart';

class UpdatePropertyScreen extends StatefulWidget {
  final PropertieModel property;

  UpdatePropertyScreen({super.key, required this.property});

  @override
  State<UpdatePropertyScreen> createState() => _UpdatePropertyScreenState();
}

class _UpdatePropertyScreenState extends State<UpdatePropertyScreen> {
  String? selectedPropertyType;

  late TextEditingController OwnerController;
  late TextEditingController titleController;
  late TextEditingController areaController;
  late TextEditingController priceController;
  late TextEditingController bedController;
  late TextEditingController bathController;
  late TextEditingController locationController;
  late TextEditingController descController;

  @override
  void initState() {
    String? selectedPropertyType;
    OwnerController = TextEditingController(text: widget.property.ownerName);

    titleController = TextEditingController(text: widget.property.title);
    areaController = TextEditingController(
      text: widget.property.area.toString(),
    );
    priceController = TextEditingController(
      text: widget.property.price.toString(),
    );
    bedController = TextEditingController(text: widget.property.bed.toString());
    bathController = TextEditingController(
      text: widget.property.bath.toString(),
    );
    locationController = TextEditingController(text: widget.property.location);
    descController = TextEditingController(text: widget.property.description);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Icon(Icons.arrow_back_ios_new, color: Colors.white),
                  ),
                ),
                SizedBox(width: 75),
                Text(
                  textAlign: TextAlign.center,
                  "Update Property",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(child: SizedBox()),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CustomTextField(
                          hint: "Owner Name",
                          icon: Icons.person,
                          controller: OwnerController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Title",
                          icon: Icons.title,
                          controller: titleController,
                        ),
                        const SizedBox(height: 10),

                        DropdownButtonFormField<String>(
                          value: selectedPropertyType,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.home),
                            hintText: "Select Property Type",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
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

                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Area(Marla)",
                          icon: Icons.scale,
                          controller: areaController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Price",
                          icon: Icons.price_change,
                          controller: priceController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Bedrooms(Bed)",
                          icon: Icons.bed,
                          controller: bedController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Bathrooms(Bath)",
                          icon: Icons.bathroom,
                          controller: bathController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Location",
                          icon: Icons.location_city,
                          controller: locationController,
                        ),
                        const SizedBox(height: 10),

                        CustomTextField(
                          hint: "Description",
                          icon: Icons.description,
                          controller: descController,
                        ),

                        const SizedBox(height: 30),

                        Consumer<OwnerPropertyProvider>(
                          builder: (context, provider, child) {
                            return AppElevatedButton(
                              width: double.infinity,
                              height: 70,
                              ContainerColor: Colors.green.shade700,
                              borderRadius: 15,
                              TextColor: Colors.white,
                              fontSize: 20,
                              child: provider.isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : Text(
                                      "Update Property",
                                      style: GoogleFonts.poppins(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                              onPressed: () async {
                                try {
                                  await context
                                      .read<OwnerPropertyProvider>()
                                      .UpdateProperty(
                                        ownerName: OwnerController.text,
                                        title: titleController.text,
                                        propertyType: selectedPropertyType
                                            .toString(),
                                        area: double.parse(areaController.text),
                                        price: double.parse(
                                          priceController.text,
                                        ),
                                        bed: int.parse(bedController.text),
                                        bath: int.parse(bedController.text),
                                        location: locationController.text,
                                        description: descController.text,
                                        id: widget.property.id!,
                                        ownerID: widget.property.ownerID!,
                                      );
                                  Navigator.pop(context);
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
          ],
        ),
      ),
    );
  }
}
