import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/manager/show_bookMarked_cubit/show_book_marked_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/price_Rating_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkItem extends StatelessWidget {
  const BookMarkItem({super.key, required this.bookMarked});
  final BookModelMarked bookMarked;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * .16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AspectRatio(
                aspectRatio: 2.5 / 4,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: CachedNetworkImage(
                    imageUrl: bookMarked.image,
                    fit: BoxFit.cover,
                    errorWidget:
                        (context, url, error) => Center(
                          child: Text(
                            'Not Found !',
                            style: Styles.textStyle14.copyWith(
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                        ),
                    placeholder:
                        (context, url) => const Center(
                          child: CircularProgressIndicator(color: Colors.grey),
                        ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Text(
                        bookMarked.title,
                        style: Styles.textStyle18.copyWith(
                          fontFamily: kGetSectraFont,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      bookMarked.authors,
                      maxLines: 1,
                      style: Styles.textStyle14.copyWith(
                        color: const Color(0xff707070),
                      ),
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Text(
                        bookMarked.category,
                        style: Styles.textStyle14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Spacer(flex: 1),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .4,
                      child: Row(
                        children: [
                          Text(
                            'Free \$',
                            style: Styles.textStyle20.copyWith(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(flex: 1),
                          PriceRatingItem(
                            count: bookMarked.count,
                            rating: bookMarked.rating,
                            detail: false,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  bookMarked.delete();
                  BlocProvider.of<ShowBookMarkedCubit>(context).showMarked();
                },
                icon: const Icon(Icons.delete_rounded),
                color: Colors.red[900],
              ),
            ],
          ),
        ),
        const Divider(color: Colors.white, indent: 75, endIndent: 10),
      ],
    );
  }
}
