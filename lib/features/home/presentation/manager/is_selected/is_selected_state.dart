part of 'is_selected_cubit.dart';

abstract class IsSelectedState extends Equatable {
  const IsSelectedState();

  @override
  List<Object> get props => [];
}

class IsSelectedInitial extends IsSelectedState {}
class BookMarkedIsPressed extends IsSelectedState {
  final bool isPreseed;

 const BookMarkedIsPressed({required this.isPreseed});
}
class BookMarkedIsNotPressed extends IsSelectedState {
  final bool isPreseed;

  const  BookMarkedIsNotPressed({required this.isPreseed});


}


