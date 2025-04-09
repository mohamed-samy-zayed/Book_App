import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/utils/widgets/custom_iconButton.dart';
import 'package:book_app/features/BookMark/presentation/manager/show_bookMarked_cubit/show_book_marked_cubit.dart';
import 'package:book_app/features/BookMark/presentation/views/widgets/bookMark_listView.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookmarkBody extends StatefulWidget {
  const BookmarkBody({super.key});

  @override
  State<BookmarkBody> createState() => _BookmarkBodyState();
}

class _BookmarkBodyState extends State<BookmarkBody> {
  @override
  void initState() {
    BlocProvider.of<ShowBookMarkedCubit>(context).showMarked();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 16, top: 60),
      child: Column(
        spacing: 20,
        children: [
          Row(
            spacing: MediaQuery.of(context).size.width * .23,
            children: [
              CustomIconButton(
                icon: Icons.arrow_back_ios_rounded,
                color: Colors.white,
                size: 45,
                iconSize: 18,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
              const Text('BookMarks', style: Styles.textStyle20),
            ],
          ),

          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: BookmarkListview(),
            ),
          ),
        ],
      ),
    );
  }
}
