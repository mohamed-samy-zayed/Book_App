import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/widgets/custom_Loading.dart';
import 'package:book_app/core/utils/widgets/custom_failureDialog.dart';
import 'package:book_app/features/home/presentation/manager/similar_books/similarbooks_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DetailsimilarListview extends StatelessWidget {
  const DetailsimilarListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
      builder: (context, state) {
        if (state is SimilarbooksFailure) {
          return CustomFailuredialog(erorrMessage: state.erorrMessage);
        }
        if (state is SimilarbooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .17,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: GestureDetector(
                     onTap: () {
                        GoRouter.of(context).pushReplacement(AppRoute.kDetailPath,
                            extra: state.books[index]);
                      },
                    child: Item(
                      imageUrl:
                          state.books[index].volumeInfo!.imageLinks?.thumbnail,
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return const CustomLoading(
            isHorizontal: true,
            height: 80,
            width: 40,
            
          );
        }
      },
    );
  }
}
