import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:propertie_explore/core/debouncer/debouncer.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:provider/provider.dart';

class PropertySearchBar extends StatefulWidget {
  const PropertySearchBar({super.key});

  @override
  State<PropertySearchBar> createState() => _PropertySearchBarState();
}

class _PropertySearchBarState extends State<PropertySearchBar> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: TextField(
        onChanged: (value) {
          print("Typing: $value");
          _debouncer.run(() {
            print("Debouncer Executed");
            context.read<OwnerPropertyProvider>().updateSearch(value);
          });
        },
        decoration: InputDecoration(
          hintText: "Search properties...",
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
