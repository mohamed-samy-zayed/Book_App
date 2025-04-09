import 'package:book_app/constatnts.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key, required this.onSubmited});
  final Function(String) onSubmited;

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onSubmitted: widget.onSubmited,
      showCursor: true,
      cursorColor: Colors.white,
      style: Styles.textStyle14.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: kContainerColor,
        suffix: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              controller.clear();
              BlocProvider.of<SearchusersCubit>(context).filterNames();
            },
            icon: const Icon(
              Icons.clear_all_rounded,
              color: Colors.white,
            ),
          ),
        ),
        prefixIcon: const Icon(
          Icons.search,
          color:Colors.white,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: kContainerColor)),
        hintText: "Search...",
        hintStyle: Styles.textStyle14
            .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
        errorStyle: Styles.textStyle14.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
