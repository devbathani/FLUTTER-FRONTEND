import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharingLogoContainer extends StatelessWidget {
  const SharingLogoContainer({
    Key? key,
    required this.title,
    required this.imageAssetsPath,
  }) : super(key: key);

  final String title;
  final String imageAssetsPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageAssetsPath,
          fit: BoxFit.cover,
          height: 35,
          width: 40,
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          title,
          style: GoogleFonts.roboto(
            textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
