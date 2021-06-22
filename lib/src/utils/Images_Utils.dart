import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:petcare/src/models/image.dart';

const API_KEY = "877878943366681";
const API_SECRET = "ulE_Sx6161eo_u0xPZwUT3W8V5c";
const CLOUD_NAME = "petcare123";

final _cloudinary = Cloudinary(
  API_KEY,
  API_SECRET,
  CLOUD_NAME,
);
var baseUrl =
    Uri.parse('https://api.cloudinary.com/v1_1/petcare123/resources/image');

Future<List<Resources>> getImages() async {
  return await http.get(baseUrl).then((response) {
    Data an = Data.fromJson(json.decode(response.body.toString()));
    return an.resources;
  });
}

Future<String> uploadImage(String imagePath) async {
  final response = await _cloudinary.uploadFile(
    filePath: imagePath,
    resourceType: CloudinaryResourceType.image,
  );
  if (response.isSuccessful)
    return response.secureUrl;
  else
    return null;
}

Future<bool> deleteImage(String imagePath) async {
  final response = await _cloudinary.deleteFile(
    url: imagePath,
    resourceType: CloudinaryResourceType.image,
    invalidate: false,
  );

  return response.isSuccessful;
}
