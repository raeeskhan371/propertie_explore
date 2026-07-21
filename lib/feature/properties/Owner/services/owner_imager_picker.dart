import 'dart:io';

import 'package:image_picker/image_picker.dart';

class OwnerImagerPicker {
  final ImagePicker _picker = ImagePicker();

  Future<List<File>> pickImageFromGallery() async {
    final List<XFile> images = await _picker.pickMultiImage();

    if (images.isEmpty) {
      return [];
    } else {
      return images.map((image) => File(image.path)).toList();
    }
  }
}
