import 'package:flutter/material.dart';

import '../../constant/app_constanst.dart';
import 'components/about_form.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Apps'),
        backgroundColor: kGreenLeaf,
      ),
      body: const AboutForm(),
    );
  }
}
