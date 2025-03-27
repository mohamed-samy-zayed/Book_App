import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/home/data/repos/home_repo_imple.dart';
import 'package:book_app/features/BookMark/presentation/manager/book_marked/book_marked_cubit.dart';
import 'package:book_app/features/home/presentation/manager/featured_books/featuredbooks_cubit.dart';
import 'package:book_app/features/home/presentation/manager/is_selected/is_selected_cubit.dart';
import 'package:book_app/features/home/presentation/manager/newest_books/newestbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServicesLocator();
  runApp(DevicePreview(
      enabled: !kReleaseMode, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedbooksCubit(getIt.get<HomeRepoImple>())..featchListViewBooks(),
        ),
        BlocProvider(
          create: (context) => NewestbooksCubit(getIt.get<HomeRepoImple>())..newestBooks(),
        ),
        BlocProvider(
          create: (context) => BookMarkedCubit(),
        ),
         BlocProvider(
          create: (context) => IsSelectedCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        title: 'Book App',
        darkTheme: ThemeData(
          useMaterial3: false,
        ),
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimarycolor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
//book app

