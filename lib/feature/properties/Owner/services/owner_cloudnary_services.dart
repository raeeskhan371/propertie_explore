import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OwnerCloudnaryServices {
  static const String _cloudname = "iuh7jjzy";
  static const String _uploadPreset = "property_images";

  // create function for to uplado imge on cloudnary server and then return to as url

  Future<List<String>> uploadImages(List<File> imagesFile) async {
    // imageurls return and store in this list
    final List<String> imageUrls = [];
    final Uri url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$_cloudname/image/upload",
    );

    for (File image in imagesFile) {
      final request = await http.MultipartRequest("POST", url);
      // provide preset

      request.fields["upload_preset"] = _uploadPreset;

      // image reading process and add into file list

      request.files.add(await http.MultipartFile.fromPath("file", image.path));

      final response = await request.send();

      final responseData = await response.stream.bytesToString();

      final data = jsonDecode(responseData);

      print("Response:${response.statusCode}");
      print("Data:${responseData}");

      if (response.statusCode == 200) {
        imageUrls.add(data["secure_url"]);
      } else {
        throw Exception(data["error"]["message"]);
      }
    }
    return imageUrls;
  }
}
