import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/BookMark/presentation/manager/book_marked/book_marked_cubit.dart';
import 'package:book_app/features/home/presentation/manager/is_selected/is_selected_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomDeatailsappbar extends StatefulWidget {
  const CustomDeatailsappbar({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<CustomDeatailsappbar> createState() => _CustomDeatailsappbarState();
}

class _CustomDeatailsappbarState extends State<CustomDeatailsappbar> {
  
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
        BlocListener<BookMarkedCubit, BookMarkedState>(
          listener: (context, state) {
            if (state is BookMarkedSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                'You Add it to BooMark',
                style: Styles.textStyle18,
              )));
            }

            if (state is BookMarkedFailure) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                'You remove it to BooMark',
                style: Styles.textStyle18,
              )));
            }
          },
          child: BlocBuilder<IsSelectedCubit, IsSelectedState>(
            builder: (context, state) {
              if (state is BookMarkedIsPressed) {
                
                return IconButton(
                  onPressed: () {
            BlocProvider.of<IsSelectedCubit>(context)
                .onPressed(isPress: true);
                  BlocProvider.of<BookMarkedCubit>(context)
                .bookMarked( isPressed: false);
          
           
          },
                  icon: Icon(
                          Icons.bookmark_rounded,
                          color: Colors.red[900],
                          size: 32,
                        ),
                );
              }else{
                 
                 return IconButton(
                  onPressed: () {
            BlocProvider.of<IsSelectedCubit>(context)
                .onPressed(isPress: false);
          
          
                 BlocProvider.of<BookMarkedCubit>(context)
                .bookMarked( isPressed: true,marked:widget.bookModel );
          },
                   icon: const Icon(
                           Icons.bookmark_rounded,
                           size: 32,
                         ),
                 );
          
              }
              
            },
          ),
          ),
        
      ],
    );
  }

  
}
