import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_dialog/Ui/widgets/sharing_logos.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
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
                      color: Colors.white,
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
                      color: Colors.white,
                      fontSize: w / 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0.25 * h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => Dialog(
                            alignment: Alignment.bottomCenter,
                            backgroundColor: Colors.white,
                            child: SizedBox(
                              height: 200,
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: const [
                                        SharingLogoContainer(
                                          title: "Instagram",
                                          imageAssetsPath:
                                              'assets/instagram_logo 1.png',
                                        ),
                                        SharingLogoContainer(
                                          title: "FaceBook",
                                          imageAssetsPath:
                                              'assets/facebook_logo 1.png',
                                        ),
                                        SharingLogoContainer(
                                          title: "YouTube",
                                          imageAssetsPath:
                                              'assets/download (1) 2.png',
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: h * 0.07,
                        width: w * 0.50,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Show Dialog",
                            style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: w * 0.70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Thank You 🙏",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: w / 20,
                    fontWeight: FontWeight.w500,
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
