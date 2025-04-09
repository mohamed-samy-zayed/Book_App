import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/search/data/repos/search_repo.dart';
import 'package:meta/meta.dart';

part 'searchusers_state.dart';

class SearchusersCubit extends Cubit<SearchusersState> {
  SearchusersCubit(this.searchRepo) : super(SearchusersInitial());

   final SearchRepo searchRepo;
  

Future<void> filterNames({ String? name}) async  {
   if( name == null || name.isEmpty ){
    emit(SearchusersInitial());
   }
     else {
  emit(SearchusersLoading());
  
       var result = await searchRepo.fetchSearchBooks(
  title: name,
       );
      result.fold((failure) {
  emit(SearchusersFailure(errorMessage: failure.erorrMessage,
  q: name
  ));
      }, (filter) {
  emit(SearchusersFilter(filterNames: filter,
  q: name));
      });
}




      // final filteredList = namesUser
      //     .where(
      //       (filterName) => filterName
      //           .toString()
      //           .toLowerCase()
      //           .contains(name.toLowerCase()),
      //     )
      //     .toList();
      // if (filteredList.isNotEmpty) {
      //   emit(SearchusersFilter(filterNames: filteredList));
      // } else {
      //   emit(SearchusersFailure());
      // }
    
  }
}
