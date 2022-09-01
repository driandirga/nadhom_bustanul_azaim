import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  final Color color;
  const Background({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: color,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: SafeArea(child: child),
      ),
    );
  }
}
