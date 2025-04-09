
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/item_moreDetails.dart';
import 'package:flutter/material.dart';

class MoreDetails extends StatelessWidget {
  const MoreDetails({super.key, required this.bookModel});
  final BookModel bookModel;
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
              subTitle: bookModel.volumeInfo!.publisher ?? 'None',
            ),
            ItemMoreDetails(
              title: 'Pages',
              subTitle: bookModel.volumeInfo!.pageCount.toString(),
            ),
            ItemMoreDetails(
              title: 'Language',
              subTitle: bookModel.volumeInfo!.language ?? 'None',
            ),
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ItemMoreDetails(
              title: 'Date of Publish',
              subTitle: bookModel.volumeInfo!.publishedDate ?? 'None',
            ),
            ItemMoreDetails(
              title: 'Genre',
              subTitle:getGenre(), 
            ),
          ],
        ),
      ],
    );
  }
  String getGenre() {
  if (bookModel.volumeInfo!.categories != null &&
      bookModel.volumeInfo!.categories!.isNotEmpty) {
    if (bookModel.volumeInfo!.categories!.length > 1) {
      return '${bookModel.volumeInfo!.categories![0]},${bookModel.volumeInfo!.categories![1]}';
    } else {
      return bookModel.volumeInfo!.categories![0];
    }
  } else {
    return 'None';
  }}
}
