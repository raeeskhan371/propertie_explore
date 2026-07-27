import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/add_button.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/desc_location_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/drop_down_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/header_add_screen.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/image_uplaod_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/add_screen_widgets/title_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/area_price_section.dart';
import 'package:propertie_explore/feature/properties/Owner/widgets/update_screen_widgets/bed_bath_section.dart';

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
                          UploadImageContainer(),
                          SizedBox(height: 10),
                          TitleSection(titleController: titleController),
                          SizedBox(height: 10),
                          DropDownAddScreen(
                            selectedPropertyType: selectedPropertyType,
                            onChanged: (value) {
                              setState(() {
                                selectedPropertyType = value;
                              });
                            },
                          ),
                          SizedBox(height: 10),
                          AreaPriceSection(
                            areaController: areaController,
                            priceController: priceController,
                          ),
                          SizedBox(height: 10),
                          BedBathSection(
                            bedController: bedController,
                            bathController: bathController,
                          ),
                          SizedBox(height: 10),
                          DescLocationSection(
                            descController: descController,
                            locationController: locationController,
                          ),
                          SizedBox(height: 10),
                          AddButton(
                            onPropertyAdd: widget.onPropertyAdd,
                            selectedPropertyType: selectedPropertyType,
                            titleController: titleController,
                            areaController: areaController,
                            priceController: priceController,
                            bedController: bedController,
                            bathController: bathController,
                            locationController: locationController,
                            descController: descController,
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
