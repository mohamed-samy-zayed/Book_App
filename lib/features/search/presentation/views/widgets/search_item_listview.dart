import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_item.dart';
import 'package:flutter/material.dart';

class SearchItemListview extends StatelessWidget {
  const SearchItemListview({super.key, required this.names});
 final  List<BookModel> names ;
  @override
  Widget build(BuildContext context) {
   
    return SliverList.builder(

      itemCount: names.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom:10),
          child: SearchItem(
           bookModel: names[index],
          ),
        );
      },
    );
  }
}
