
import 'package:book_app/core/utils/widgets/custom_snackBar.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/manager/show_bookMarked_cubit/show_book_marked_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookmarkDeatailsappbar extends StatefulWidget {
  const BookmarkDeatailsappbar({super.key, required this.bookMark,});
  final BookModelMarked bookMark;
  
  @override
  State<BookmarkDeatailsappbar> createState() => _BookmarkDeatailsappbarState();
}

class _BookmarkDeatailsappbarState extends State<BookmarkDeatailsappbar> {
  bool isMarked = true;
 

  void removeBookMark() {
    
     if (isMarked == true) {
  customSnackBar(
             context,
             message: 'Book remove from your BookMarks',
             icon: Icons.bookmark_remove_rounded,
            );
      setState(() {
   isMarked = false;
      });
      widget.bookMark.delete();
      BlocProvider.of<ShowBookMarkedCubit>(context).showMarked();
}else{
   customSnackBar(
             context,
             message: "Book alredy remove Can't add again",
             icon: Icons.bookmark_remove_rounded,
            );
}
    
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
         
            
             IconButton(
              onPressed: removeBookMark,
              icon: Icon(
                Icons.bookmark_rounded,
                color:isMarked ? Colors.red[900] : Colors.grey,
                size: 32,
              ),
            
          ),
        ],
      );
  }

 
   
}






