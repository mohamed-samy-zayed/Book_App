import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/widgets/custom_Loading.dart';
import 'package:book_app/core/utils/widgets/custom_failureDialog.dart';
import 'package:book_app/features/home/presentation/views/widgets/item.dart';
import 'package:book_app/features/home/presentation/manager/featured_books/featuredbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomListviewHorizontal extends StatelessWidget {
  const CustomListviewHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedbooksCubit, FeaturedbooksState>(
      builder: (context, state) {
        if (state is FeaturedbooksFailure) {
          return CustomFailuredialog(erorrMessage: state.erorrMessage);
        }
        if (state is FeaturedbooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .21,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(AppRoute.kDetailPath,
                            extra: state.books[index]);
                      },
                      child: Item(
                        imageUrl: state.books[index].volumeInfo!.imageLinks!
                                .thumbnail 
                            ,
                      )),
                );
              },
            ),
          );
        } else {
          return const CustomLoading(
            isHorizontal: true,
            height: 100,
            width: 50,
          );
        }
      },
    );
  }
}
