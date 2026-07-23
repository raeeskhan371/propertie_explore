import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:provider/provider.dart';

class UpdateButton extends StatelessWidget {
  String id;
  String selectedPropertyType;
  TextEditingController titleController;
  TextEditingController areaController;
  TextEditingController priceController;
  TextEditingController bedController;
  TextEditingController bathController;
  TextEditingController locationController;
  TextEditingController descController;
  List<String> oldImagesUrl = [];
  UpdateButton({
    super.key,
    required this.selectedPropertyType,

    required this.titleController,
    required this.areaController,
    required this.priceController,
    required this.bedController,
    required this.bathController,
    required this.locationController,
    required this.descController,
    required this.oldImagesUrl,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<OwnerPropertyProvider>(
      builder: (context, provider, child) {
        return AppElevatedButton(
          width: double.infinity,
          height: 70,
          ContainerColor: Colors.green.shade700,
          borderRadius: 15,
          TextColor: Colors.white,
          fontSize: 20,
          child: provider.isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  "Update Property",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          onPressed: () async {
            try {
              await context.read<OwnerPropertyProvider>().UpdateProperty(
                title: titleController.text,
                propertyType: selectedPropertyType.toString(),
                area: double.parse(areaController.text),
                price: double.parse(priceController.text),
                bed: int.parse(bedController.text),
                bath: int.parse(bedController.text),
                location: locationController.text,
                description: descController.text,
                id: id!,
                oldImagesUrl: oldImagesUrl,
              );
              Navigator.pop(context);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString().replaceFirst("Exception:", "")),
                ),
              );
            }
          },
        );
      },
    );
  }
}
