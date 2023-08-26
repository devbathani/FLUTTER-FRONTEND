import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animated_text_package/textstyle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFBAB7E),
              Color(0xffF7CE68),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    //Rotate Animation
                    RotateAnimatedText(
                      'AWESOME',
                      textStyle: CommonTextStyle.commonTextStyle,
                    ),
                    RotateAnimatedText(
                      'OPTIMISTIC',
                      textStyle: CommonTextStyle.commonTextStyle,
                    ),
                    RotateAnimatedText(
                      'DIFFERENT',
                      textStyle: CommonTextStyle.commonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    //Fade Animation
                    FadeAnimatedText(
                      'do IT!',
                      textStyle: CommonTextStyle.commonTextStyle,
                    ),
                    FadeAnimatedText(
                      'do it RIGHT!!',
                      textStyle: CommonTextStyle.commonTextStyle,
                    ),
                    FadeAnimatedText(
                      'do it RIGHT NOW!!!',
                      textStyle: CommonTextStyle.commonTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    ScaleAnimatedText('Think',
                        textStyle: CommonTextStyle.commonTextStyle),
                    ScaleAnimatedText('Build',
                        textStyle: CommonTextStyle.commonTextStyle),
                    ScaleAnimatedText('Ship',
                        textStyle: CommonTextStyle.commonTextStyle),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
