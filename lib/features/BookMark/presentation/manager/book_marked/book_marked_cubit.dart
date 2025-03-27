import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'book_marked_state.dart';

class BookMarkedCubit extends Cubit<BookMarkedState> {
  BookMarkedCubit() : super(BookMarkedLoading());

                
List<BookModel> markedList = [];

  Future<void> bookMarked({
   BookModel? marked, required bool isPressed,int? index})async{
      // SharedPreferences sharedPreferences =
      //            await SharedPreferences.getInstance();
    
    
    if ( marked == null  ) {
  if (isPressed == true) {
  emit(BookMarkedInitial());
}else{
  emit(BookMarkedFailure());
  // sharedPreferences.remove('BookModel');
  if (index != null) {
  markedList.removeAt(index);
}else{
  markedList.clear();
}
  
}
}else{
  
 markedList.add(marked);
  // sharedPreferences.setStringList('BookModel',markedList as List<String>);
  emit(BookMarkedSuccess(bookedList: markedList));


  }


  


}


 
     
  
}
