import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/price_Rating_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({
    super.key,
    required this.bookModel,
    required this.index,
  });
  final BookModel bookModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.kDetailPath, extra: bookModel);
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .16,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child:
                    bookModel.volumeInfo!.imageLinks?.thumbnail == null
                        ? Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: kContainerColor,
                          ),
                          child: Center(
                            child: Text(
                              'Not Found !',
                              style: Styles.textStyle14.copyWith(fontSize: 10),
                            ),
                          ),
                        )
                        : CachedNetworkImage(
                          imageUrl:
                              bookModel.volumeInfo!.imageLinks!.thumbnail!,
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
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              ),
                        ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      style: Styles.textStyle19.copyWith(
                        fontFamily: kGetSectraFont,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    getAuthor(bookModel: bookModel),
                    style: Styles.textStyle14.copyWith(
                      color: const Color(0xff707070),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo!.categories![0],
                      style: Styles.textStyle14,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Row(
                      children: [
                        Text(
                          'Free \$',
                          style: Styles.textStyle20.copyWith(
                            color: Colors.green,
                            fontSize: 18,
                          ),
                        ),
                        const Spacer(flex: 1),
                        PriceRatingItem(
                          count: bookModel.volumeInfo!.ratingsCount ?? 0,
                          rating: bookModel.volumeInfo!.averageRating ?? 0,
                          detail: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getAuthor({required BookModel bookModel}) {
  if (bookModel.volumeInfo!.authors != null) {
    if (bookModel.volumeInfo!.authors!.length > 1) {
      return '${bookModel.volumeInfo!.authors![0]}\n${bookModel.volumeInfo!.authors![1]}';
    } else {
      return bookModel.volumeInfo!.authors![0];
    }
  } else {
    return 'None';
  }
}
