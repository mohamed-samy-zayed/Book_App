import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'is_selected_state.dart';

class IsSelectedCubit extends Cubit<IsSelectedState> {
  IsSelectedCubit() : super(IsSelectedInitial());

  
void onPressed({required  bool isPress}){
  isPress = !isPress;
  if (isPress == true) {
  emit(BookMarkedIsPressed(isPreseed: isPress));
}else{
  emit(BookMarkedIsNotPressed(isPreseed: isPress));
}
}

  
}
