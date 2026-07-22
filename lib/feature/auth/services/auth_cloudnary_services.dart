import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

class AuthCloudnaryServices {
  static const String _cloudName = "iuh7jjzy";
  static const String _uploadpreset = "profile_image";

  Future<String> profileimage(File profileImage) async {
    final Uri url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$_cloudName/image/upload",
    );

    final request = http.MultipartRequest("Post", url);

    request.fields["upload_preset"] = _uploadpreset;

    request.files.add(
      await http.MultipartFile.fromPath("file", profileImage.path),
    );

    final response = await request.send();
    final responseData = await response.stream.bytesToString();
    final data = jsonDecode(responseData);
    if (response.statusCode == 200) {
      return data["secure_url"];
    } else {
      throw Exception(data['error']["message"]);
    }
  }
}
