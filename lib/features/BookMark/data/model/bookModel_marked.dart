

import 'package:hive/hive.dart';

part 'bookModel_marked.g.dart';

@HiveType(typeId: 0)
class BookModelMarked extends HiveObject{
@HiveField(0)
  final String image;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String  authors;
  @HiveField(3)
  final String category;
  @HiveField(4)
  final num count;
  @HiveField(5)
  final num rating;
  @HiveField(6)
  final String about;
  @HiveField(7)
  final String link;
  @HiveField(8)
  final String genre;
  @HiveField(9)
  final String date ;
  @HiveField(10)
  final int pages;
  @HiveField(11)
  final String publisher;
  @HiveField(12)
  final String language;
  
  

  BookModelMarked( { required this.language,required this.genre, required this.date, required this.pages, required this.publisher,  required this.link,required this.about, required this.rating, required this.count,   required this.image, required this.title, required this.authors, required this.category});
}