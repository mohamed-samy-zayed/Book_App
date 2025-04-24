import 'package:book_app/core/utils/functions/custom_Url_Lanuncher.dart';
import 'package:book_app/core/utils/widgets/custom_button.dart';
import 'package:book_app/features/BookMark/data/model/bookModel_marked.dart';
import 'package:flutter/material.dart';

class PriceBookmarkbutton extends StatelessWidget {
  const PriceBookmarkbutton({super.key, required this.bookMark});
  final BookModelMarked bookMark;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          onPressed: () {},
          text: 'Free',
          fontSize: 20,
          backgroundColor: Colors.green,
          textColor: Colors.black,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        CustomButton(
          onPressed: () async {
            customUrlLauncher(
              context: context,
              url:bookMark.link ,
            );
          },
          fontSize: 16,
          text: getText(bookMark: bookMark),
          backgroundColor: Colors.red,
          textColor: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ],
    );
  }
}

String getText({required BookModelMarked bookMark}) {
  if (bookMark.link  != 'None') {
    return 'Preview';
  } else {
    return 'Not Available!';
  }
}
