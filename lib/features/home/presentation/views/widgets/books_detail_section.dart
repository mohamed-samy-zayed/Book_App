import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/item.dart';
import 'package:book_app/features/home/presentation/views/widgets/more_details.dart';
import 'package:book_app/features/home/presentation/views/widgets/price_Rating_item.dart';
import 'package:book_app/features/home/presentation/views/widgets/price_button.dart';
import 'package:flutter/material.dart';

class BooksDetailSection extends StatelessWidget {
  const BooksDetailSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: Item(
            imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? 'None',
          ),
        ),
        const SizedBox(height: 20),
        Text(
          bookModel.volumeInfo!.title ?? 'None',
          style: Styles.textStyle30.copyWith(fontFamily: kGetSectraFont),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            getAuthor(bookModel: bookModel),
            textAlign: TextAlign.center,
            style: Styles.textStyle20,
          ),
        ),
        const SizedBox(height: 8),

        const SizedBox(height: 6),
        PriceRatingItem(
          count: bookModel.volumeInfo!.ratingsCount ?? 0,
          rating: bookModel.volumeInfo!.averageRating ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
          detail: true,
        ),
        const SizedBox(height: 30),
        PriceButton(bookModel: bookModel),
        const SizedBox(height: 30),
        MoreDetails(bookModel: bookModel),
        const SizedBox(height: 30),
        getAbout(),
      ],
    );
  }

  Widget getAbout() {
    if (bookModel.volumeInfo!.description == null) {
      return const SizedBox(height: 100);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview :',
            style: Styles.textStyle20,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 6),
          Text(
            bookModel.volumeInfo!.description!,
            style: Styles.textStyle14.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w200,
            ),
            textAlign: TextAlign.left,
          ),
        ],
      );
    }
  }
}

String getAuthor({required BookModel bookModel}) {
  if (bookModel.volumeInfo!.authors != null &&
      bookModel.volumeInfo!.authors!.isNotEmpty) {
    if (bookModel.volumeInfo!.authors!.length > 1) {
      return '${bookModel.volumeInfo!.authors![0]}\n${bookModel.volumeInfo!.authors![1]}';
    } else {
      return bookModel.volumeInfo!.authors![0];
    }
  } else {
    return 'None';
  }
}
