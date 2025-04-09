import 'package:book_app/core/utils/widgets/custom_Loading.dart';
import 'package:book_app/core/utils/widgets/custom_failureDialog.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_item.dart';
import 'package:book_app/features/home/presentation/manager/newest_books/newestbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListview extends StatelessWidget {
  const BestSellerListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestbooksCubit, NewestbooksState>(
      builder: (context, state) {
        if (state is NewestbooksFailure) {
          return CustomFailuredialog(erorrMessage: state.erorrMessage);
        }
        if (state is NewestbooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height *
                ((state.books.length + 9) / 10),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BestSellerItem(
                    index : index,
                    bookModel: state.books[index],
                  ),
                );
              },
            ),
          );
        } else {
          return const CustomLoading(
            isHorizontal: false,
          );
        }
      },
    );
  }
}
