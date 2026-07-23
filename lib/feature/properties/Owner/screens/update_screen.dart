import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/area_price_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/bed_bath_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/location_description.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/name_title.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/property_dropdown.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/update_button.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/update_property_header.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/update_property_image_section.dart';

class UpdatePropertyScreen extends StatefulWidget {
  final PropertieModel property;

  UpdatePropertyScreen({super.key, required this.property});

  @override
  State<UpdatePropertyScreen> createState() => _UpdatePropertyScreenState();
}

class _UpdatePropertyScreenState extends State<UpdatePropertyScreen> {
  String? selectedPropertyType;

  late TextEditingController titleController;
  late TextEditingController areaController;
  late TextEditingController priceController;
  late TextEditingController bedController;
  late TextEditingController bathController;
  late TextEditingController locationController;
  late TextEditingController descController;
  List<String> oldImagesUrl = [];

  @override
  void initState() {
    selectedPropertyType = widget.property.propertyType;

    oldImagesUrl = List.from(widget.property.propertyImageUrls);

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
            const SizedBox(height: 10),
            UpdatePropertyHeader(),
            // Main Container
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
                        SizedBox(
                          child: UpdatePropertyImageSection(
                            oldImageUrls: oldImagesUrl,
                          ),
                        ),

                        NameTitle(titleController: titleController),
                        const SizedBox(height: 10),
                        PropertyDropdown(
                          selectedPropertyType: selectedPropertyType!,
                        ),
                        const SizedBox(height: 10),
                        AreaPriceSection(
                          areaController: areaController,
                          priceController: priceController,
                        ),
                        const SizedBox(height: 10),
                        BedBathSection(
                          bedController: bedController,
                          bathController: bathController,
                        ),
                        const SizedBox(height: 10),
                        LocationDescription(
                          locationController: locationController,
                          descController: descController,
                        ),
                        const SizedBox(height: 30),
                        UpdateButton(
                          selectedPropertyType: selectedPropertyType!,
                          titleController: titleController,
                          areaController: areaController,
                          priceController: priceController,
                          bedController: bedController,
                          bathController: bathController,
                          locationController: locationController,
                          descController: descController,
                          oldImagesUrl: oldImagesUrl,
                          id: widget.property.id!,
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
