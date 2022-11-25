import 'dart:convert';

import 'package:flutter_staggered_grid_view_package/repo/image_entity.dart';
import 'package:http/http.dart' as http;

class ImageRepo {
  static Future<ImageEntity> getImage() async {
    ImageEntity imagList;
    final response = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=31590296-a3ea606a5370743e3ed108b83"));
    imagList = imageEntityFromJson(response.body);
    return imagList;
  }
}
