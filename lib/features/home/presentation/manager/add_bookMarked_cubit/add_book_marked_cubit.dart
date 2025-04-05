import 'package:bloc/bloc.dart';
import 'package:book_app/constatnts.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_book_marked_state.dart';

class AddBookMarkedCubit extends Cubit<AddBookMarkedState> {
  AddBookMarkedCubit() : super(AddBookMarkedInitial());

   addBookMarked( bool isPressed ,BookModelMarked? marked) async {
    emit(AddBookMarkedLoading());
     var bookMarked = Hive.box<BookModelMarked>(kBookMarkedBox);
   if (marked != null && isPressed == true  ) {
  try {
   
    await bookMarked.add(marked);
   
    emit(AddBookMarkedSuccess());
  } catch (e) {
    
    emit(
      AddBookMarkedFailure(
        errorMessage: e.toString(),
      ),
    );
  }
}else{
  emit(AddBookMarkedRemove());
  await bookMarked.delete(marked);
}


  }
}
