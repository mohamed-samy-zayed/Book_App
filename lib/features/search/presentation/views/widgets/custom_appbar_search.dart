
import 'package:book_app/core/utils/widgets/custom_iconButton.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_textField.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarSearch extends StatelessWidget {
 const  CustomAppBarSearch({
    super.key, required this.onSubmited,
  });
  
  final dynamic Function(String) onSubmited;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        spacing: 10,
        children: [
          CustomIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 45,
            iconSize: 18,
            onPressed: () {
              GoRouter.of(context).pop();
            },
          ),
          Expanded(
            child: SearchTextfield(
              onSubmited: onSubmited,
            ),
          ),
        ],
      ),
    );
  }
}
