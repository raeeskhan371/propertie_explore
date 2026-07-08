import 'package:flutter/material.dart';
import 'package:propertie_explore/core/widgets/custome_ElevetedButton.dart';
import 'package:propertie_explore/core/widgets/custome_Textfield.dart';
import 'package:propertie_explore/feature/properties/house_owner/services/services.dart';

class AddPropertie extends StatefulWidget {
  const AddPropertie({super.key});

  @override
  State<AddPropertie> createState() => _AddPropertieState();
}

class _AddPropertieState extends State<AddPropertie> {
  TextEditingController OwnerController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController bedController = TextEditingController();
  TextEditingController bathController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descController = TextEditingController();
  String propertieSelected = "Select Propertie Type";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Propertie"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          AppTextformField(controller: OwnerController, hintText: "Owner Name"),
          SizedBox(height: 10),
          AppTextformField(controller: titleController, hintText: "title"),
          SizedBox(height: 10),
          // AppTextformField(hintText: "propertyType"),
          DropdownButtonFormField(
            decoration: InputDecoration(enabledBorder: OutlineInputBorder()),
            hint: Text("Select Property Type"),

            items: [
              DropdownMenuItem(value: "house", child: Text("House")),
              DropdownMenuItem(value: "flat", child: Text("Flat")),
              DropdownMenuItem(value: "farm house", child: Text("Farm House")),
              DropdownMenuItem(value: "Plot", child: Text("Plot")),
            ],
            onChanged: (value) {
              propertieSelected = value!;
            },
          ),
          SizedBox(height: 10),
          AppTextformField(controller: areaController, hintText: "area Marla"),
          SizedBox(height: 10),
          AppTextformField(controller: priceController, hintText: "price"),
          SizedBox(height: 10),
          AppTextformField(controller: bedController, hintText: "bed"),
          SizedBox(height: 10),
          AppTextformField(controller: bathController, hintText: "bath"),
          SizedBox(height: 10),
          AppTextformField(
            controller: locationController,
            hintText: "location",
          ),
          SizedBox(height: 10),
          AppTextformField(controller: descController, hintText: "description"),
          SizedBox(height: 10),
          AppElevatedButton(
            ButtonText: "Add Propertie",
            width: 370,
            height: 50,
            ContainerColor: Colors.green,
            borderRadius: 20,
            TextColor: Colors.white,
            fontSize: 20,
            onPressed: () async {
              // Cheacking Controllers

              String ownerName = OwnerController.text;
              String title = titleController.text;
              PropertyServices property = PropertyServices();
              String propertyType = propertieSelected;
              double area = double.parse(areaController.text);
              double price = double.parse(priceController.text);
              int bath = int.parse(bathController.text);
              int bed = int.parse(bedController.text);
              String location = locationController.text;
              String description = descController.text;

              await property.addProperty(
                ownerName: ownerName,
                title: title,
                propertyType: propertyType,
                area: area,
                price: price,
                bed: bed,
                bath: bath,
                location: location,
                description: description,
              );
            },
          ),
        ],
      ),
    );
  }
}
