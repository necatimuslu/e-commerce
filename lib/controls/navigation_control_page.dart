import 'package:flutter/material.dart';
import 'package:twitterapp/pages/screens/bottom_bar_screen/profile_screen.dart';
import 'package:twitterapp/pages/screens/bottom_bar_screen/notification_screen.dart';
import 'package:twitterapp/pages/screens/bottom_bar_screen/search_screen.dart';
import 'package:twitterapp/pages/screens/home/home_screen.dart';
import 'package:twitterapp/utils/constants.dart';

class NavigationControlPage extends StatefulWidget {
  const NavigationControlPage({Key? key}) : super(key: key);

  @override
  State<NavigationControlPage> createState() => _NavigationControlPageState();
}

class _NavigationControlPageState extends State<NavigationControlPage> {
  int pageIndex = 0;
  Widget bottomBarMenu(int currentIndex) {
    if (currentIndex == 0) {
      return const HomeScreen();
    } else if (currentIndex == 1) {
      return const SearchScreen();
    } else if (currentIndex == 2) {
      return const NotificationScreen();
    } else {
      return const ProfileScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: pageIndex,
          selectedItemColor: mainDarkBlue,
          unselectedItemColor: mainLightBlue,
          onTap: (int value) {
            setState(() {
              pageIndex = value;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: mainLightBlue,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.search,
                color: mainLightBlue,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.notifications,
                color: mainLightBlue,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person_outline,
                color: mainLightBlue,
              ),
              label: '',
            ),
          ],
        ),
        body: bottomBarMenu(pageIndex),
      ),
    );
  }
}
