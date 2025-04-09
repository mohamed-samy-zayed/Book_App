
import 'package:book_app/core/utils/widgets/custom_snackBar.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/manager/show_bookMarked_cubit/show_book_marked_cubit.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/add_bookMarked_cubit/add_book_marked_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomDeatailsappbar extends StatefulWidget {
  const CustomDeatailsappbar({super.key, required this.bookModel,});
  final BookModel bookModel;
  
  @override
  State<CustomDeatailsappbar> createState() => _CustomDeatailsappbarState();
}

class _CustomDeatailsappbarState extends State<CustomDeatailsappbar> {
  bool isMarked = false;
  @override
  void initState() {
    super.initState();
    checkFavoriteStatus();
  }

  void checkFavoriteStatus() {
    bool bookMarkStatus;
    List<BookModelMarked> markedList = BlocProvider.of<ShowBookMarkedCubit>(context).marked ?? [] ;
     if (markedList.isNotEmpty) {
   bookMarkStatus = markedList.any((filterName) => filterName.title == widget.bookModel.volumeInfo!.title);
}else{
  bookMarkStatus = false;
}
    
    setState(() {
      isMarked = bookMarkStatus;
    });
  }

  void toggleFavorite()  {
    
    if (isMarked) {
      
    BlocProvider.of<AddBookMarkedCubit>(context).removeBookMarked(widget.bookModel.volumeInfo!.title!);
    BlocProvider.of<ShowBookMarkedCubit>(context).showMarked();
    } else {
      var bookMarked = BookModelMarked(
                      image: widget.bookModel.volumeInfo!.imageLinks!.thumbnail ??
                          'Not Found!',
                      title: widget.bookModel.volumeInfo!.title ?? 'None',
                      authors: getAuthor(bookModel: widget.bookModel),
                      category:
                          widget.bookModel.volumeInfo!.categories?[0] ?? 'None',
                          count:widget.bookModel.volumeInfo!.ratingsCount ?? 0,
                          rating:widget.bookModel.volumeInfo!.averageRating ?? 0,
                          about: widget. bookModel.volumeInfo!.description ?? 'None',

                    );
                    BlocProvider.of<AddBookMarkedCubit>(context).addBookMarked(bookMarked,);
                    BlocProvider.of<ShowBookMarkedCubit>(context).showMarked();
    }
    checkFavoriteStatus();
  }


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
               customSnackBar(
                context,
                message: 'Book added to your BookMarks',
                icon: Icons.bookmark_added_rounded,
               );
              }
        
              if (state is AddBookMarkedRemove) {
                 customSnackBar(
                context,
                message: 'Book remove to your BookMarks',
                icon: Icons.bookmark_remove_rounded,
               );
              }
            },
            child:
             IconButton(
              onPressed: toggleFavorite,
              icon: Icon(
                Icons.bookmark_rounded,
                color:isMarked ? Colors.red[900] : Colors.grey,
                size: 32,
              ),
            ),
          ),
        ],
      );
  }

 
   
}






