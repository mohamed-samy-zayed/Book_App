import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/BookMarkDetailsView_body.dart';
import 'package:flutter/material.dart';

class BookMarkDetailsView extends StatelessWidget{
  const BookMarkDetailsView({super.key, required this.bookMark,});
static String id  = 'BookMarkDetailsView';
final BookModelMarked bookMark;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookMarkDetailsViewBody(
        
        bookMark: bookMark,
      )),
    );
  }
}