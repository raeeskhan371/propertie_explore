import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:propertie_explore/core/util/appWidgets/Custome_text_field.dart';

class TitleSection extends StatelessWidget {
  TextEditingController titleController = TextEditingController();

  TitleSection({super.key, required this.titleController});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      inputformatter: [],
      hint: "Title",
      icon: Icons.title,
      controller: titleController,
      textCap: TextCapitalization.words,
    );
  }
}
