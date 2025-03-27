import 'dart:math';

import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImple implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImple(this.apiServices);
  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String title}) async {
    try {
      var data = await apiServices.get(
        
          endPoint: 'q=$title');
      List<dynamic> items = data['items'];
      List<BookModel> books = [];

      for (var element in items) {
        books.add(BookModel.fromJson(element));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromdDioException(e));
      }
    }
    return left(ServerFailure(erorrMessage: e.toString()));
  }

  
}
