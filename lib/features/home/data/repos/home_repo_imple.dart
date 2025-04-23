import 'dart:math';

import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/core/utils/api_services.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImple implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImple(this.apiServices);

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiServices.get(
          endPoint: 'Filtering=free-ebooks&q=subject:fantasy&Sorting=newest');
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchListviewBooks() async {
    try {
      var data = await apiServices.get(
          endPoint:
              'Filtering=free-ebooks&q=subject:books&Sorting=relevance');
     
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiServices.get(
          endPoint: 'Filtering=free-ebooks&q=subject:$category&Sorting=newest');
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
