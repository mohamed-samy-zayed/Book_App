part of 'newestbooks_cubit.dart';

abstract class NewestbooksState extends Equatable {
  const NewestbooksState();

  @override
  List<Object> get props => [];
}

class NewestbooksInitial extends NewestbooksState {}
class NewestbooksLoading extends NewestbooksState {}
class NewestbooksFailure extends NewestbooksState {
  final String erorrMessage;

 const NewestbooksFailure({required this.erorrMessage});
}
class NewestbooksSuccess extends NewestbooksState {
  final List<BookModel> books;

  const NewestbooksSuccess({required this.books});
}


