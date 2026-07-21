import 'dart:io';

import 'package:image_picker/image_picker.dart';

class AuthImagePickerServices {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> profileImagePicker() async {
    final XFile? profileimage = await _imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (profileimage == null) {
      return null;
    } else
      return File(profileimage.path);
  }
}
