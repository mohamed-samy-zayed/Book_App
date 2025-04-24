import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:book_app/features/BookMark/presentation/views/BookMarkDetails_view.dart';
import 'package:book_app/features/BookMark/presentation/views/BookMark_view.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo_imple.dart';
import 'package:book_app/features/home/presentation/manager/similar_books/similarbooks_cubit.dart';
import 'package:book_app/features/home/presentation/views/details_view.dart';
import 'package:book_app/features/home/presentation/views/home_view.dart';
import 'package:book_app/features/search/presentation/views/search_view.dart';
import 'package:book_app/features/splash/presentation/Views/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoute {
  static String kHomePath = '/HomeView';
  static String kDetailPath = '/DetailsView';
  static String kSearchPath = '/SearchView';
    static String kBookMarkPath = '/BookmarkView';
  static String kBookMarkDetailPath = '/BookMarkDetailsView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: kHomePath,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kDetailPath,
      builder: (context, state) {
return BlocProvider(
        create: (context) => SimilarbooksCubit(getIt.get<HomeRepoImple>()),
        child:DetailsView(
          bookModel: state.extra as BookModel,
          
        ),
      );

      } 
    ),
    GoRoute(
      path: kSearchPath,
      builder: (context, state) => const SearchView(),
    ),

    GoRoute(
      path: kBookMarkPath,
      builder: (context, state) => const BookmarkView(),
    ),
     GoRoute(
      path: kBookMarkDetailPath,
      builder: (context, state) {
        final bookMark = state.extra as BookModelMarked ;
        return  BookMarkDetailsView(bookMark:bookMark);
      }
    )
  ]);
}
