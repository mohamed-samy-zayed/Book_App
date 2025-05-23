
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/core/utils/widgets/custom_Loading.dart';
import 'package:book_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_item_listview.dart';
import 'package:book_app/features/search/presentation/views/widgets/custom_appbar_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(left: 20, top: 60, right: 20),
          sliver: SliverToBoxAdapter(
            
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                CustomAppBarSearch(
                  onSubmited: (p0) {
                    BlocProvider.of<SearchusersCubit>(context)
                        .filterNames(name: p0);
                  },
                ),
                BlocBuilder<SearchusersCubit, SearchusersState>(
                  builder: (context, state) {
                    if (state is SearchusersFilter) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 20, bottom: 20),
                        child: Text(
                          'Result of " ${state.q} "',
                          style: Styles.textStyle14,
                        ),
                      );
                    } else {
                      return const SizedBox(
                        height: 40,
                      );
                    }
                  },
                ),
              ])),
        ),
        BlocBuilder<SearchusersCubit, SearchusersState>(
          builder: (context, state) {
            if (state is SearchusersFilter) {
              return SliverPadding(
                padding: const EdgeInsets.only(left: 30, bottom: 60, right: 20),
                sliver: SearchItemListview(
                  names: state.filterNames,
                ),
              );
            } else if (state is SearchusersLoading) {
              return const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 30, bottom: 60, right: 20),
                  child: CustomLoading(
                    isHorizontal: false,
                  ),
                ),
              );
            } else if (state is SearchusersFailure) {
              return SliverToBoxAdapter(
                  child: Text(
                'No Results of " ${state.q} "',
                style: Styles.textStyle14,
                textAlign: TextAlign.center,
              ));
            } else {
              return const SliverToBoxAdapter(child: SizedBox());
            }
          },
        )
      ],
    );
  }
}
