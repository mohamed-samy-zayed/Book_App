import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featuredbooks_state.dart';

class FeaturedbooksCubit extends Cubit<FeaturedbooksState> {
  FeaturedbooksCubit(this.homeRepo) : super(FeaturedbooksInitial());

  final HomeRepo homeRepo;

  Future<void> featchListViewBooks() async {
    emit(FeaturedbooksLoading());
    var result = await homeRepo.fetchListviewBooks();
    
    
    result.fold((failure) {
      emit(FeaturedbooksFailure(erorrMessage: failure.erorrMessage));
    }, (books) {
      emit(FeaturedbooksSuccess(books: books));
    });
  }
}
