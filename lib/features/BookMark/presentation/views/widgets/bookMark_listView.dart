import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMark%20_item.dart';
import 'package:book_app/features/BookMark/presentation/manager/book_marked/book_marked_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkListview extends StatelessWidget {
  const BookmarkListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarkedCubit, BookMarkedState>(
      builder: (context, state) {
        if (state is BookMarkedSuccess) {
          return ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<BookMarkedCubit>(context)
                      .bookMarked(isPressed: false, marked: null);
                },
                child: Text(
                  'Clear All',
                  textAlign: TextAlign.right,
                  style: Styles.textStyle18.copyWith(
                    color: Colors.red[900],
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: (state.bookedList.length / 3).toInt(),
                padding: const EdgeInsets.only(bottom: 10, top: 0),
                itemBuilder: (context, index) {
                  return BookMarkItem(
                    image: state.bookedList[index].volumeInfo!.imageLinks!
                            .thumbnail ??
                        'Not Found!',
                    title: state.bookedList[index].volumeInfo!.title ?? 'None',
                    authors: getAuthor(bookModel: state.bookedList[index]),
                    category:
                        state.bookedList[index].volumeInfo!.categories?[0] ??
                            'None',
                            index: index,
                  );
                },
              ),
            ],
          );
        } else {
          return const Center(
            child: Text(
              'No Booked Any Books',
              style: Styles.textStyle18,
            ),
          );
        }
      },
    );
  }
}
