import 'package:flutter/rendering.dart';

class CloudnaryHelper {
  static String optimizeImage({
    required String imageUrl,
    required int width,
    required int height,
  }) {
    debugPrint("[ExplorePropertyApp](CloudnaryHelper) optimizeImage() Called");
    String transformation = "w_$width,h_$height,c_fill,q_auto,f_auto";

    return imageUrl.replaceFirst("upload/", "upload/$transformation/");
  }
}
