import 'package:book_app/features/splash/presentation/Views/widgets/splash_page_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
 static String id = 'SplashPage';
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
 body: SplashPageBody(),
    );
  }
}