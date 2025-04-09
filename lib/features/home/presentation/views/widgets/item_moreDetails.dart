
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class ItemMoreDetails extends StatelessWidget {
  const ItemMoreDetails({
    super.key,
     required this.title, required this.subTitle,
  });

  final String title,subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Opacity(
          opacity: .7,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.textStyle18.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
    
        const SizedBox(height: 8),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: Styles.textStyle18.copyWith(
            color: Colors.white,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
