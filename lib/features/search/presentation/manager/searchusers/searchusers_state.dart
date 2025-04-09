part of 'searchusers_cubit.dart';




@immutable
abstract class SearchusersState {}

class SearchusersInitial extends SearchusersState {
}
class SearchusersFilter extends SearchusersState {
  final List<BookModel> filterNames;
  final String q;

  SearchusersFilter( {required this.filterNames, required this.q,});
}
class SearchusersFailure extends SearchusersState {
  final String errorMessage,q;

  SearchusersFailure( {required this.errorMessage,required this.q,});
  
}
class SearchusersLoading extends SearchusersState {
  
  
}


