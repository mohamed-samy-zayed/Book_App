

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
  final int count;
  @HiveField(5)
  final num rating;
  @HiveField(6)
  final String about;
  

  BookModelMarked(   {required this.about, required this.rating, required this.count,   required this.image, required this.title, required this.authors, required this.category});
}