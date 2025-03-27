import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/presentation/manager/book_marked/book_marked_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookMarkItem extends StatelessWidget {
  const BookMarkItem({
    super.key, required this.image, required this.title, required this.authors, required this.category, required this.index,
  });
final String image,title,authors,category;
final int index;
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
                image,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                    child: Text(
                  'Not Found !',
                  style: Styles.textStyle16
                      .copyWith(color: Colors.black, fontSize: 10),
                )),
              )),
          title: Text(
            // 'Harry Potter Azkaban',
            title,
            style: Styles.textStyle18.copyWith(
              fontFamily: kGetSectraFont,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
           trailing: IconButton(
            onPressed: () {
BlocProvider.of<BookMarkedCubit>(context).bookMarked(isPressed: false,index: index,marked: null);
              
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
               authors,
                  style: Styles.textStyle16
                      .copyWith(color: const Color(0xff707070))),
              const SizedBox(
                height: 2,
              ),
              Text(
               // 'Fantasy',
               category,
                style: Styles.textStyle16,
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
