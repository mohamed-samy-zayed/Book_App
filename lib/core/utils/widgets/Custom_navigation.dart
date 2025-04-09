import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key, required this.index});
  final int index;
  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.index;
    return BottomNavigationBar(
        backgroundColor: kPrimarycolor,
        currentIndex: selectedIndex,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w800,
        ),
        iconSize: 32,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Colors.green[900],
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });

          if (value == 0) {
            if (selectedIndex == 0) {
              GoRouter.of(context).pushReplacement(AppRoute.kHomePath);
            }
          } else if (value == 1) {
            GoRouter.of(context).pushReplacement(AppRoute.kBookMarkPath);
          }
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.home_rounded,
                ),
              )),
          BottomNavigationBarItem(
              label: 'BookMark',
              icon: Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(Icons.bookmark_rounded),
              )),
        ]);
  }
}
