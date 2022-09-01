import 'package:flutter/material.dart';

class AboutImage extends StatelessWidget {
  const AboutImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(flex: 3, child: Image.asset('assets/images/ic_tentang.png')),
        const Spacer(),
      ],
    );
  }
}
