import 'dart:io';

import 'package:image_picker/image_picker.dart';

class OwnerImagerPicker {
  final ImagePicker _picker = ImagePicker();

  Future<File?> pickImageFromGallerty() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image == null) {
      return null;
    } else {
        return  File(image.path);
    }
  }
}
