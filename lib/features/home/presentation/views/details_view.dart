import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/manager/similar_books/similarbooks_cubit.dart';
import 'package:book_app/features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.bookModel,});
static String id  = 'DetailsView';
final BookModel bookModel;




  @override
  State<DetailsView> createState() => _DetailsViewState();

}

class _DetailsViewState extends State<DetailsView> {

  @override
  void initState() {
    BlocProvider.of<SimilarbooksCubit>(context).similarBooks(category: widget.bookModel.volumeInfo!.categories![0]);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: DetailsViewBody(
        bookModel: widget.bookModel,
        
      )),
    );
  }
}