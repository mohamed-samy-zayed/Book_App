import 'package:book_app/core/errors/failure.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo{

Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();
Future<Either<Failure,List<BookModel>>> fetchListviewBooks();
Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});

}