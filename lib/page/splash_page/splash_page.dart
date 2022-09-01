import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import '../../constant/app_constanst.dart';
import '../../constant/background.dart';
import '../../constant/responsive.dart';
import '../home_page/home_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      color: kGreenDark,
      child: Responsive(
        mobile: AnimatedSplashScreen(
          splash: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  'assets/images/ic_splash.png',
                  fit: BoxFit.cover,
                ),
              ),
              // Align(
              //   alignment: const Alignment(0.0, 0.9),
              //   child: RichText(
              //     text: const TextSpan(
              //       style: TextStyle(
              //           color: kBase,
              //           fontSize: 21,
              //           fontFamily: 'Tupats',
              //           fontWeight: FontWeight.bold),
              //       children: [
              //         TextSpan(
              //           text: 'Aini Farida',
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
          duration: 3000,
          splashIconSize: size.height,
          nextScreen: const HomePage(),
        ),
      ),
    );
  }
}
