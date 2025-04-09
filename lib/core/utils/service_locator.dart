import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/features/home/data/repos/home_repo_imple.dart';
import 'package:book_app/features/search/data/repos/search_repo_imple.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));
  getIt.registerSingleton<HomeRepoImple>(
      HomeRepoImple(getIt.get<ApiServices>()));
  getIt.registerSingleton<SearchRepoImple>(
      SearchRepoImple(getIt.get<ApiServices>()));
}
