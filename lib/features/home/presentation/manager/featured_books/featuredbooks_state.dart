part of 'featuredbooks_cubit.dart';

abstract class FeaturedbooksState extends Equatable {
  const FeaturedbooksState();

  @override
  List<Object> get props => [];
}

class FeaturedbooksInitial extends FeaturedbooksState {}
class FeaturedbooksSuccess extends FeaturedbooksState {
  final List <BookModel> books;

  const FeaturedbooksSuccess({required this.books});
}
class FeaturedbooksFailure extends FeaturedbooksState {
  final String erorrMessage;

  const FeaturedbooksFailure({required this.erorrMessage});
}
class FeaturedbooksLoading extends FeaturedbooksState {}


