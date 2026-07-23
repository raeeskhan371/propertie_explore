import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class AreaPriceSection extends StatelessWidget {
  TextEditingController areaController;
  TextEditingController priceController;

  AreaPriceSection({
    super.key,
    required this.areaController,
    required this.priceController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.numberWithOptions(decimal: true),
            inputformatter: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            hint: "Area(Marla)",
            icon: Icons.scale,
            controller: areaController,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: CustomTextField(
            textInputType: TextInputType.numberWithOptions(decimal: true),
            inputformatter: [
              FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
            ],
            hint: "Price",
            icon: Icons.price_change,
            controller: priceController,
          ),
        ),
      ],
    );
  }
}
