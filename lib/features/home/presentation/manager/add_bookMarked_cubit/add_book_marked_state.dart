part of 'add_book_marked_cubit.dart';

abstract class AddBookMarkedState extends Equatable {
  const AddBookMarkedState();

  @override
  List<Object> get props => [];
}

class AddBookMarkedInitial extends AddBookMarkedState {}

class AddBookMarkedLoading extends AddBookMarkedState {}

class AddBookMarkedSuccess extends AddBookMarkedState {}
class AddBookMarkedRemove extends AddBookMarkedState {}
class AddBookMarkedError extends AddBookMarkedState {
  final String message;
 const AddBookMarkedError(this.message);
}