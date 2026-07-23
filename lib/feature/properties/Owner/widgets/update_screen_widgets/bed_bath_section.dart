import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class BedBathSection extends StatelessWidget {
  TextEditingController bedController;
  TextEditingController bathController;
  BedBathSection({
    super.key,
    required this.bedController,
    required this.bathController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.numberWithOptions(),
            inputformatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            hint: "Bed",
            icon: Icons.bed,
            controller: bedController,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.numberWithOptions(),
            inputformatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
            hint: "Bath",
            icon: Icons.bathroom,
            controller: bathController,
          ),
        ),
      ],
    );
  }
}
