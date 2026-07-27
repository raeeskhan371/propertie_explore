import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownAddScreen extends StatefulWidget {
  String? selectedPropertyType;
  final ValueChanged<String?> onChanged;
  DropDownAddScreen({
    super.key,
    required this.selectedPropertyType,
    required this.onChanged,
  });

  @override
  State<DropDownAddScreen> createState() => _DropDownAddScreenState();
}

class _DropDownAddScreenState extends State<DropDownAddScreen> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      value: widget.selectedPropertyType,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(Icons.home, color: Colors.green),
        hintText: "Select Property Type",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(15),
        ),
        focusColor: Colors.white,
      ),
      items: [
        DropdownMenuItem(value: "House", child: Text("House")),
        DropdownMenuItem(value: "Apartment", child: Text("Apartment")),
        DropdownMenuItem(value: "Plot", child: Text("Plot")),
        DropdownMenuItem(value: "Commercial", child: Text("Commercial")),
      ],
      onChanged: (value) {
        widget.onChanged(value);
      },
    );
  }
}
