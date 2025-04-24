import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMark_deatailsAppBar.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/booksMark_detail_section.dart';
import 'package:flutter/material.dart';

class BookMarkDetailsViewBody extends StatelessWidget {
  const BookMarkDetailsViewBody({super.key, required this.bookMark,});
  final BookModelMarked bookMark;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 0),
      children: [
       BookmarkDeatailsappbar(
          bookMark: bookMark,
         
        ),
        BooksmarkDetailSection(
          bookMark: bookMark,
        ),
     
      ],
    );
  }
}
