import 'package:bustanul_azaim/constant/app_constanst.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'about_image.dart';

class AboutForm extends StatelessWidget {
  const AboutForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AboutImage(),
            const SizedBox(height: 16),
            RichText(
              text: TextSpan(
                style: GoogleFonts.montserrat(color: kBlack, fontSize: 24),
                children: const [
                  TextSpan(
                    text: 'Nadhom ',
                  ),
                  TextSpan(
                    text: 'Bustanul Azaim',
                    style: TextStyle(
                        color: kGreenDark, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Versi : 1.0.1',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Pembuat : Faridatul Aini',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
