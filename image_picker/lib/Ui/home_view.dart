import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

final h = Get.height;
final w = Get.width;

File? _image;
final picker = ImagePicker();

class _HomeViewState extends State<HomeView> {
  ///Getting Image from camera
  _imgFromCamera() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  ///Getting image from gallery
  _imgFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: h * 0.08,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "FLutter Frontend",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: w / 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Text(
                  "Hey there 👋",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: w / 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 0.20 * h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: _imgFromCamera,
                child: Container(
                  height: h * 0.12,
                  width: w * 0.40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 1.5,
                        color: Colors.grey.shade600,
                        offset: const Offset(4, 4),
                      ),
                      const BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 1.5,
                        color: Colors.white,
                        offset: Offset(-4, -4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0.02 * w),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Click Image",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 0.05 * w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                          size: w * 0.08,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: _imgFromGallery,
                child: Container(
                  height: h * 0.12,
                  width: w * 0.40,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 1.5,
                        color: Colors.grey.shade600,
                        offset: const Offset(4, 4),
                      ),
                      const BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 1.5,
                        color: Colors.white,
                        offset: Offset(-4, -4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(0.02 * w),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pick Image",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 0.05 * w,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Icon(
                          Icons.photo,
                          color: Colors.grey,
                          size: w * 0.08,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: h * 0.30,
                width: w * 0.85,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 1.5,
                      color: Colors.grey.shade600,
                      offset: const Offset(4, 4),
                    ),
                    const BoxShadow(
                      blurRadius: 15,
                      spreadRadius: 1.5,
                      color: Colors.white,
                      offset: Offset(-4, -4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(0.02 * w),
                ),
                child: Center(
                  child: _image == null
                      ? Text(
                          "Your Image",
                          style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 0.08 * w,
                            ),
                          ),
                        )
                      : Image.file(
                          _image!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
