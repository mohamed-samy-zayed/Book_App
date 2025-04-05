import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookMarkItem extends StatelessWidget {
  const BookMarkItem({
    super.key, required this.bookMarked, 
  });
final BookModelMarked bookMarked; 
  @override
  Widget build(BuildContext context) {
    return
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          horizontalTitleGap: 20,
          contentPadding: EdgeInsets.zero,
          leading: Container(
              height: 150,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.grey.withOpacity(.5),
              ),
              child: CachedNetworkImage(
                imageUrl: 
                // 'https://m.media-amazon.com/images/I/51dOacmuzvL._SY445_SX342_.jpg',
                bookMarked.image,
                fit: BoxFit.cover,
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
            // 'Harry Potter Azkaban',
            bookMarked.title,
            style: Styles.textStyle18.copyWith(
              fontFamily: kGetSectraFont,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
           trailing: IconButton(
            onPressed: () {
bookMarked.delete();
              
            },
            icon: Icon(
              Icons.delete_rounded,
              color: Colors.red[900],
            )),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3,
              ),
              Text(
                //'Mohamed Samy',
               bookMarked.authors,
                  style: Styles.textStyle14
                      .copyWith(color: const Color(0xff707070))),
              const SizedBox(
                height: 2,
              ),
              Text(
               // 'Fantasy',
               bookMarked.category,
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
