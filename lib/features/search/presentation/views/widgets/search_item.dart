import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          horizontalTitleGap: 20,
          contentPadding: EdgeInsets.zero,
          onTap: () {
            GoRouter.of(context).push(AppRoute.kDetailPath, extra: bookModel);
          },
          leading: Container(
              height: 150,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.grey.withOpacity(.5),
              ),
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? "Not Found !",
                fit: BoxFit.fitWidth,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                    child: Text(
                  'Not Found !',
                  style: Styles.textStyle14
                      .copyWith(color: Colors.black, fontSize: 10),
                )),
              )),
          title: Text(
            bookModel.volumeInfo!.title! ,
            style: Styles.textStyle18.copyWith(
              fontFamily: kGetSectraFont,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3,
              ),
              Text(getAuthor(bookModel: bookModel)  ,
                  style: Styles.textStyle14
                      .copyWith(color: const Color(0xff707070))),
              const SizedBox(
                height: 2,
              ),
              Text(
                bookModel.volumeInfo!.categories?[0] ?? 'None',
                style: Styles.textStyle14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.white,
          indent: 75,
          endIndent: 10,
        ),
      ],
    );
  }
}
