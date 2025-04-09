
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMark_body.dart';
import 'package:flutter/material.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({super.key});

  @override
  Widget build(BuildContext context) {
    return 

     const Scaffold(
        // bottomNavigationBar: CustomNavigator(
        //   index: 1,
        // ),
        body: BookmarkBody());
  }
}
