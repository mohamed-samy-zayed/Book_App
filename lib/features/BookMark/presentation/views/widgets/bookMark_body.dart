import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMark_listView.dart';

import 'package:flutter/material.dart';

class BookmarkBody extends StatelessWidget {
  const BookmarkBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 26, left: 26, top: 60),
      child: Column(
        spacing: 40,
        children: [
          Text(
            'BookMarks',
            style: Styles.textStyle20,
          ),
          Expanded(child: BookmarkListview())
        ],
      ),
    );
  }
}
