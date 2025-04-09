import 'package:bloc/bloc.dart';
import 'package:book_app/constatnts.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_book_marked_state.dart';

class AddBookMarkedCubit extends Cubit<AddBookMarkedState> {
  AddBookMarkedCubit() : super(AddBookMarkedInitial());

 

 Future<void>  addBookMarked( BookModelMarked marked) async {
    emit(AddBookMarkedLoading());
  try {
   final favoritesBox = Hive.box<BookModelMarked>(kBookMarkedBox);
    await favoritesBox.add(marked);
   
   emit(AddBookMarkedSuccess());
  } catch (e) {
    print("❌ Error adding to favorites: $e");
   emit(AddBookMarkedError(e.toString()));
  
}


  }


  Future<void> removeBookMarked(String title) async {
    emit(AddBookMarkedLoading());
    try {
      final box = Hive.box<BookModelMarked>(kBookMarkedBox);
      final keysToRemove = box.keys.where((key) {
        final item = box.get(key);
        return item?.title == title;
      }).toList();

      for (var key in keysToRemove) {
        await box.delete(key);
      }

      emit(AddBookMarkedRemove());
    } catch (e) {
      print("❌ Error removing from bookmarks: $e");
      emit(AddBookMarkedError(e.toString()));
    }
  }

  

  

 
}
