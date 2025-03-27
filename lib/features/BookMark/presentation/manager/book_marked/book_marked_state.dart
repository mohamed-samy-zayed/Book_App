part of 'book_marked_cubit.dart';

abstract class BookMarkedState extends Equatable {
  const BookMarkedState();

  @override
  List<Object> get props => [];
}

class BookMarkedInitial extends BookMarkedState {}



class BookMarkedLoading extends BookMarkedState {}
class BookMarkedFailure extends BookMarkedState {
  
}
class BookMarkedSuccess extends BookMarkedState {
  final List<BookModel> bookedList;

 const BookMarkedSuccess({required this.bookedList});
}



