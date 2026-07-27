import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/feature/properties/Owner/owner_services/owner_notification_services.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPropertyAdd;
  TextEditingController OwnerController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController bathController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  AddButton({
    super.key,
    required this.onPropertyAdd,
    required this.selectedPropertyType,

    required this.titleController,
    required this.areaController,
    required this.priceController,
    required this.bedController,
    required this.bathController,
    required this.locationController,
    required this.descController,
  });

  String? selectedPropertyType;

  @override
  Widget build(BuildContext context) {
    return Consumer<OwnerPropertyProvider>(
      builder: (context, provider, child) {
        return AppElevatedButton(
          width: 380,
          height: 50,
          ContainerColor: Colors.green.shade700,
          borderRadius: 10,
          TextColor: Colors.white,
          fontSize: 20,
          child: provider.isLoading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(
                  "Add Property",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

          onPressed: () async {
            OwnerNotificationServices notificationServices =
                OwnerNotificationServices();
            try {
              await context.read<OwnerPropertyProvider>().addProperty(
                ownerName: OwnerController.text,
                title: titleController.text,
                propertyType: selectedPropertyType.toString(),
                area: double.parse(areaController.text),
                price: double.parse(priceController.text),
                bed: int.parse(bedController.text),
                bath: int.parse(bathController.text),
                location: locationController.text,
                description: descController.text,
                imageFile: provider.selectedImage,
              );

              onPropertyAdd();
              notificationServices.showNotification(
                title: "🏡 Property Added Successfully",
                body:
                    "Your property has been added and is now available for potential buyers .",
              );
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
