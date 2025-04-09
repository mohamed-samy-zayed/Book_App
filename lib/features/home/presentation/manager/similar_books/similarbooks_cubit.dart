import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similarbooks_state.dart';

class SimilarbooksCubit extends Cubit<SimilarbooksState> {
  SimilarbooksCubit(this.homeRepo) : super(SimilarbooksInitial());
final HomeRepo homeRepo;

  Future<void> similarBooks({required String category})async {
    emit(SimilarbooksLoading());

    var result = await homeRepo.fetchSimilarBooks(
      category: category
    );
    result.fold((failure) {
      emit(SimilarbooksFailure(erorrMessage: failure.erorrMessage));
    }, (books) {
      emit(SimilarbooksSuccess(books: books));
    });
  }
  
}
