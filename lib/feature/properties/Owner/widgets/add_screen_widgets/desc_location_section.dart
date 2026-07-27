import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class DescLocationSection extends StatelessWidget {
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  DescLocationSection({
    super.key,
    required this.descController,
    required this.locationController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          textCap: TextCapitalization.words,
          textInputType: TextInputType.text,

          hint: "Location",
          icon: Icons.location_city,
          controller: locationController,
        ),
        SizedBox(height: 10),
        CustomTextField(
          textCap: TextCapitalization.words,
          textInputType: TextInputType.text,
          hint: "Description",
          icon: Icons.description,
          controller: descController,
        ),
      ],
    );
  }
}
