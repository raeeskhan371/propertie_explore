import 'package:flutter/material.dart';

class PropertyDropdown extends StatefulWidget {
  String selectedPropertyType;
  PropertyDropdown({super.key, required this.selectedPropertyType});

  @override
  State<PropertyDropdown> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PropertyDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedPropertyType,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.home),
        hintText: "Select Property Type",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
      ),
      items: const [
        DropdownMenuItem(value: "House", child: Text("House")),
        DropdownMenuItem(value: "Apartment", child: Text("Apartment")),
        DropdownMenuItem(value: "Plot", child: Text("Plot")),
        DropdownMenuItem(value: "Commercial", child: Text("Commercial")),
      ],
      onChanged: (value) {
        setState(() {
          widget.selectedPropertyType = value!;
        });
      },
    );
  }
}
