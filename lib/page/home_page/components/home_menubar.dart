import 'package:flutter/material.dart';

import '../../../constant/app_constanst.dart';
import '../../bookmark_page/bookmark_page.dart';
import 'home_form.dart';

class HomeMenuBar extends StatefulWidget {
  const HomeMenuBar({Key? key}) : super(key: key);

  @override
  State<HomeMenuBar> createState() => _HomeMenuBarState();
}

int currentIndex = 0;
final screens = [
  const HomeForm(),
  const BookmarkPage(),
];

class _HomeMenuBarState extends State<HomeMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
        ],
        iconSize: 30,
        fixedColor: kGreenDark,
        backgroundColor: kGreenYellow,
        unselectedItemColor: Colors.black54,
      ),
    );
  }
}
