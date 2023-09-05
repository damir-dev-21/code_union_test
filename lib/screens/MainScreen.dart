import 'package:code_union_test/config/colors.dart';
import 'package:code_union_test/screens/MapScreen.dart';
import 'package:code_union_test/screens/NewsScreen.dart';
import 'package:code_union_test/screens/ProfileScreen.dart';
import 'package:code_union_test/screens/MarksScreen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 3);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      navBarHeight: 75,
      screens: [
        NewsScreen(),
        MapScreen(),
        MarksScreen(),
        ProfileScreen(),
      ],
      items: [
        PersistentBottomNavBarItem(
          contentPadding: 0,
          iconSize: 25,
          textStyle: const TextStyle(fontSize: 15),
          icon: Image.asset(
            "assets/news.png",
          ),
          title: 'Лента',
          inactiveColorPrimary: Colors.black,
          activeColorPrimary: mainColor,
        ),
        PersistentBottomNavBarItem(
            contentPadding: 0,
            iconSize: 25,
            textStyle: const TextStyle(fontSize: 15),
            icon: Image.asset(
              "assets/map.png",
            ),
            title: "Карта",
            inactiveColorPrimary: Colors.black,
            activeColorSecondary: mainColor),
        PersistentBottomNavBarItem(
            contentPadding: 0,
            iconSize: 25,
            textStyle: const TextStyle(fontSize: 15),
            icon: Image.asset(
              "assets/marks.png",
            ),
            title: "Избранные",
            inactiveColorPrimary: Colors.black,
            activeColorSecondary: mainColor),
        PersistentBottomNavBarItem(
            textStyle: const TextStyle(fontSize: 15),
            contentPadding: 0,
            iconSize: 25,
            icon: const Icon(
              Icons.account_circle,
            ),
            title: "Профиль",
            inactiveColorPrimary: Colors.black,
            activeColorSecondary: mainColor),
      ],
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: _controller.index == 0 ? false : true,
      navBarStyle: NavBarStyle.style6,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: const NavBarDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        colorBehindNavBar: Colors.black,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
    );
  }
}
