import 'package:flutter/material.dart';
import 'package:propertie_explore/feature/properties/Owner/provider/owner_property_provider.dart';
import 'package:provider/provider.dart';

class UploadImageContainer extends StatefulWidget {
  const UploadImageContainer({super.key});

  @override
  State<UploadImageContainer> createState() => _ImageUplaodContainerState();
}

class _ImageUplaodContainerState extends State<UploadImageContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.green.shade300, width: 2),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.green.shade50,
              child: Icon(
                Icons.photo_camera_outlined,
                color: Colors.green,
                size: 32,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Upload Property Photos",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 6),

            Text(
              "PNG, JPG • Max 5 Images",
              style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
            ),

            const SizedBox(height: 18),

            GestureDetector(
              onTap: () {
                context.read<OwnerPropertyProvider>().pickPopertyImage();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "+ Add Photos",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
