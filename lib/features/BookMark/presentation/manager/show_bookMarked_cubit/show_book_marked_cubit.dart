import 'package:bloc/bloc.dart';
import 'package:book_app/constatnts.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'show_book_marked_state.dart';

class ShowBookMarkedCubit extends Cubit<ShowBookMarkedState> {
  ShowBookMarkedCubit() : super(ShowBookMarkedInitial());

  List<BookModelMarked>? marked;
 
  Future<void> showMarked() async {
    emit(ShowBookMarkedInitial());
     var markedBox = Hive.box<BookModelMarked>(kBookMarkedBox);
    marked = markedBox.values.toList();

    emit(ShowBookMarkedSuccess());
  }

Future<void> deleteAllMarked() async {
     var markedBox = Hive.box<BookModelMarked>(kBookMarkedBox);
     markedBox.clear();

    emit(ShowBookMarkedSuccess());
  }
 
}
