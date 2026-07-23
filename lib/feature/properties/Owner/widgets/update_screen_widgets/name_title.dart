import 'package:flutter/material.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class NameTitle extends StatelessWidget {
  TextEditingController titleController;
  NameTitle({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomTextField(
        //   hint: "Owner Name",
        //   icon: Icons.person,
        //   controller: OwnerController,
        // ),
        const SizedBox(height: 10),

        CustomTextField(
          hint: "Title",
          icon: Icons.title,
          controller: titleController,
        ),
      ],
    );
  }
}
