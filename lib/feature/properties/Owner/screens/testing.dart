import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/Owner/model/propertie_model.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:provider/provider.dart';

class TestingUpdateScreen extends StatefulWidget {
  final PropertieModel property;
  TestingUpdateScreen({super.key, required this.property});

  @override
  State<TestingUpdateScreen> createState() => _TestingUpdateScreenState();
}

class _TestingUpdateScreenState extends State<TestingUpdateScreen> {
  List<String> oldImagesUrl = [];
  @override
  void initState() {
    oldImagesUrl = List.from(widget.property.propertyImageUrls);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<OwnerPropertyProvider>(
              builder: (context, provider, child) {
                if (provider.selectedImage.isEmpty) {
                  return Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.greenAccent,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: oldImagesUrl.length,
                      itemBuilder: (context, index) {
                        final oldImages = oldImagesUrl[index];
                        return Container(child: Image.network(oldImages));
                      },
                    ),
                  );
                } else
                  return Container(
                    height: 220,
                    width: double.infinity,
                    color: Colors.greenAccent,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: provider.selectedImage.length,
                      itemBuilder: (context, index) {
                        final ReplaceImages = provider.selectedImage[index];
                        return Container(
                          child: Image(image: FileImage(ReplaceImages)),
                        );
                      },
                    ),
                  );
              },
            ),

            ElevatedButton(
              onPressed: () {
                context.read<OwnerPropertyProvider>().pickPopertyImage();
              },
              child: Text("Update image"),
            ),
          ],
        ),
      ),
    );
  }
}
