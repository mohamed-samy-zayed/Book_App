import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/manager/show_bookMarked_cubit/show_book_marked_cubit.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMark%20_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkListview extends StatelessWidget {
  const BookmarkListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowBookMarkedCubit, ShowBookMarkedState>(
      builder: (context, state) {
        List<BookModelMarked> marked =
            BlocProvider.of<ShowBookMarkedCubit>(context).marked ?? [];
        if (state is ShowBookMarkedSuccess && marked.isNotEmpty) {
          return ListView(
            padding: EdgeInsets.zero,
            physics: const BouncingScrollPhysics(),
            children: [
              GestureDetector(
                onTap: () {
                  BlocProvider.of<ShowBookMarkedCubit>(context).deleteAllMarked();
                  BlocProvider.of<ShowBookMarkedCubit>(context).showMarked();
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
                itemCount: marked.length,
                padding: const EdgeInsets.only(bottom: 10, top: 0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: BookMarkItem(
                      bookMarked: marked[index],
                    ),
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
