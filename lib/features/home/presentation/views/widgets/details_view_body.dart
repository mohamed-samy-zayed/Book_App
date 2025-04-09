import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/books_detail_section.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_DeatailsAppBar.dart';
import 'package:book_app/features/home/presentation/views/widgets/detailSimilar_listview.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.bookModel,});
  final BookModel bookModel;
  
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                CustomDeatailsappbar(
                  bookModel: bookModel,
                 
                ),
                BooksDetailSection(
                  bookModel: bookModel,
                ),
              const  SizedBox(
                  height: 39,
                )
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You can also like',
                  style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const DetailsimilarListview(),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
