import 'package:flutter/material.dart';
import '../../../constant/app_constanst.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Radius bRadius = const Radius.circular(30);
    return Stack(
      children: [
        Container(
          height: size.height / 5,
          padding: const EdgeInsets.only(
              left: dPadding * 1.5, right: dPadding * 1.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: bRadius,
              bottomRight: bRadius,
            ),
            gradient: const LinearGradient(
                colors: [kGreenTosca, kGreenYellow],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                      color: kGreenDark,
                      fontSize: 28,
                      fontFamily: 'Shayan',
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: 'Nadhom\n',
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Tupats',
                        color: kRock,
                      ),
                    ),
                    TextSpan(
                      text: 'Bustanul Azaim',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 8,
                child: Image.asset(
                  'assets/images/ic_bustanul.png',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
