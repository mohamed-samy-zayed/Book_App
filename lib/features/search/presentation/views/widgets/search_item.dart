import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
import 'package:book_app/features/home/presentation/views/widgets/price_Rating_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRoute.kDetailPath, extra: bookModel);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .16,
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 2.5 / 4,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: 
                  bookModel.volumeInfo!.imageLinks?.thumbnail == null
                      ? const SizedBox()
                      : CachedNetworkImage(
                          imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail!,
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) => Center(
                                child: Text(
                                  'Not Found !',
                                  style: Styles.textStyle14.copyWith(
                                      color: Colors.black, fontSize: 10),
                                ),
                              ),
                          placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.grey,
                                ),
                              )),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        child: Text(
                          bookModel.volumeInfo!.title?? 'None',
                          style: Styles.textStyle18.copyWith(
                            fontFamily: kGetSectraFont,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(getAuthor(bookModel: bookModel),
                       maxLines: 1,
                          style: Styles.textStyle14
                              .copyWith(color: const Color(0xff707070))),
                      const SizedBox(
                        height: 2,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          bookModel.volumeInfo!.categories?[0] ?? 'None',
                          style: Styles.textStyle14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                     const Spacer(
                              flex: 1,
                            ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Row(
                          children: [
                            Text('Free \$',
                                style: Styles.textStyle20.copyWith(
                                  color: Colors.green,
                                  fontSize: 14,
                                )),
                            const Spacer(
                              flex: 1,
                            ),
                            PriceRatingItem(
                              count: bookModel.volumeInfo!.ratingsCount ?? 0,
                              rating: bookModel.volumeInfo!.averageRating ?? 0,
                              detail: false,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const Divider(
            color: Colors.white,
            indent: 75,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
