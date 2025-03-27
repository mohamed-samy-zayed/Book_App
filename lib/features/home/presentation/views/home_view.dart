
import 'package:book_app/core/utils/widgets/Custom_navigation.dart';
import 'package:book_app/features/home/presentation/views/widgets/homePage_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomepageBody(),
      bottomNavigationBar: CustomNavigator(
        index: 0,
      ),
    );
  }
}