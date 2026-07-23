import 'package:flutter/material.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class LocationDescription extends StatelessWidget {
  TextEditingController locationController;
  TextEditingController descController;
  LocationDescription({
    super.key,
    required this.locationController,
    required this.descController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
