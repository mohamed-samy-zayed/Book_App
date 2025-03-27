import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/search/data/repos/search_repo_imple.dart';
import 'package:book_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:book_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SearchusersCubit(
        getIt.get<SearchRepoImple>()
      ),
      child: const Scaffold(
        
        body: SearchViewBody(),
      ),
    );
  }
}
