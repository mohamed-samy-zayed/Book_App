import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMarkMore_details.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/price_bookMarkButton.dart';
import 'package:book_app/features/home/presentation/views/widgets/item.dart';
import 'package:book_app/features/home/presentation/views/widgets/price_Rating_item.dart';
import 'package:flutter/material.dart';

class BooksmarkDetailSection extends StatelessWidget {
  const BooksmarkDetailSection({super.key, required this.bookMark});
  final BookModelMarked bookMark;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: Item(imageUrl: bookMark.image),
        ),
        const SizedBox(height: 20),
        Text(
          bookMark.title,
          style: Styles.textStyle30.copyWith(fontFamily: kGetSectraFont),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Opacity(
          opacity: .7,
          child: Text(
            bookMark.authors,
            textAlign: TextAlign.center,
            style: Styles.textStyle20,
          ),
        ),
        const SizedBox(height: 8),

        const SizedBox(height: 6),
        PriceRatingItem(
          count: bookMark.count,
          rating: bookMark.rating,
          mainAxisAlignment: MainAxisAlignment.center,
          detail: true,
        ),
        const SizedBox(height: 30),
        PriceBookmarkbutton(bookMark: bookMark),
        const SizedBox(height: 30),
        BookmarkmoreDetails(bookMark: bookMark),
        const SizedBox(height: 30),
        getAbout(),
      ],
    );
  }

  Widget getAbout() {
    if (bookMark.about == 'None' || bookMark.about == 'See:') {
      return const SizedBox(height: 1);
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        mainAxisSize: MainAxisSize.min,

        children: [
          const Text(
            'Overview :',
            style: Styles.textStyle20,
            textAlign: TextAlign.left,
          ),
          const SizedBox(height: 6),
          Text(
            bookMark.about,
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
