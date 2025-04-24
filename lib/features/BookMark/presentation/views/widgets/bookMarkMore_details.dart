
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/home/presentation/views/widgets/item_moreDetails.dart';
import 'package:flutter/material.dart';

class BookmarkmoreDetails extends StatelessWidget {
  const BookmarkmoreDetails({super.key, required this.bookMark});
  final BookModelMarked bookMark;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ItemMoreDetails(
              title: 'Publisher',
              subTitle: bookMark.publisher,
            ),
            ItemMoreDetails(
              title: 'Pages',
              subTitle: bookMark.pages.toString(),
            ),
            ItemMoreDetails(
              title: 'Language',
              subTitle: bookMark.language,
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemMoreDetails(
              title: 'Date of Publish',
              subTitle: bookMark.date,
            ),
            ItemMoreDetails(
              title: 'Genre',
              subTitle:bookMark.genre, 
            ),
          ],
        ),
      ],
    );
  }
  
}
