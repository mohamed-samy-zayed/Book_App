import 'package:bloc/bloc.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this.homeRepo) : super(NewestbooksInitial());
  final HomeRepo homeRepo;

  Future<void> newestBooks() async {
    emit(NewestbooksLoading());

    var result = await homeRepo.fetchBestSellerBooks();
    result.fold((failure) {
      emit(NewestbooksFailure(erorrMessage: failure.erorrMessage));
    }, (books) {
      emit(NewestbooksSuccess(books: books));
    });
  }
}
