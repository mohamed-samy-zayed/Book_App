import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/manager/show_bookMarked_cubit/show_book_marked_cubit.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/add_bookMarked_cubit/add_book_marked_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomDeatailsappbar extends StatefulWidget {
  const CustomDeatailsappbar({super.key, required this.bookModel, required this.index});
  final BookModel bookModel;
  final int index;
  @override
  State<CustomDeatailsappbar> createState() => _CustomDeatailsappbarState();
}

class _CustomDeatailsappbarState extends State<CustomDeatailsappbar> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
                
              },
              icon: const Icon(
                Icons.close,
                size: 30,
              )),
          BlocListener<AddBookMarkedCubit, AddBookMarkedState>(
            listener: (context, state) {
              if (state is AddBookMarkedSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'You Add it to BooMark',
                  style: Styles.textStyle18,
                )));
              }
        
              if (state is AddBookMarkedRemove) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                  'You remove it to BooMark',
                  style: Styles.textStyle18,
                )));
              }
            },
            child: IconButton(
              onPressed: () {
                setState(() {
                  pressed = !pressed;
                 
                });
                 if (pressed == true) {
                    var bookMarked = BookModelMarked(
                      image: widget.bookModel.volumeInfo!.imageLinks!.thumbnail ??
                          'Not Found!',
                      title: widget.bookModel.volumeInfo!.title ?? 'None',
                      authors: getAuthor(bookModel: widget.bookModel),
                      category:
                          widget.bookModel.volumeInfo!.categories?[0] ?? 'None',
                          pressed: true,

                    );
                     
        
                    BlocProvider.of<AddBookMarkedCubit>(context).addBookMarked(true,bookMarked,);
                    BlocProvider.of<ShowBookMarkedCubit>(context).showNote();
                    
                    
                   
                  } else {
                    BlocProvider.of<AddBookMarkedCubit>(context).addBookMarked(false,null);
                   
                  }
                  
              },
              icon: Icon(
                Icons.bookmark_rounded,
                color:getColor(),
                size: 32,
              ),
            ),
          ),
        ],
      );
  }

  getColor(){
    final markedList = BlocProvider.of<ShowBookMarkedCubit>(context).marked;

// final isBookMarked = markedList?.any((filterName) => filterName.pressed == true) ?? false;
final isBookMark = markedList?.any((filterName) => filterName.title == widget.bookModel.volumeInfo!.title)?? false;
if(isBookMark == true){
  return  Colors.red[900];
}else{
return Colors.grey;
}
  }
   
}






