import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        right: 20,
      ),
      child: Row(
        children: [
          Image.asset(
            AssetsImage.logo,
            height: 22,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoute.kSearchPath);
            },
            icon: const Icon(
              Icons.search_rounded,
              size: 26,
            ),
          ),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRoute.kBookMarkPath);
            },
            icon: const Icon(
              Icons.bookmark_rounded,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
