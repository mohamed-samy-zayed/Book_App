import 'package:bloc/bloc.dart';
import 'package:book_app/constatnts.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'show_book_marked_state.dart';

class ShowBookMarkedCubit extends Cubit<ShowBookMarkedState> {
  ShowBookMarkedCubit() : super(ShowBookMarkedInitial());

  List<BookModelMarked>? marked;

  showNote() async{
 
 
  var markedBox = Hive.box<BookModelMarked>(kBookMarkedBox);
 marked = markedBox.values.toList();
 
  emit(ShowBookMarkedSuccess(
    marked: markedBox.values.toList()
  ));

   
 
  }
}
