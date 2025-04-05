part of 'add_book_marked_cubit.dart';

abstract class AddBookMarkedState extends Equatable {
  const AddBookMarkedState();

  @override
  List<Object> get props => [];
}

class AddBookMarkedInitial extends AddBookMarkedState {}
class AddBookMarkedLoading extends AddBookMarkedState {}
class AddBookMarkedSuccess extends AddBookMarkedState {
  
}
class AddBookMarkedFailure extends AddBookMarkedState {
  final String errorMessage;

 const AddBookMarkedFailure({required this.errorMessage});
}
class AddBookMarkedRemove extends AddBookMarkedState {}
