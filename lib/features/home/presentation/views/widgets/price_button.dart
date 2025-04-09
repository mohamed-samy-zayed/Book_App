import 'package:book_app/core/utils/functions/custom_Url_Lanuncher.dart';
import 'package:book_app/core/utils/widgets/custom_button.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({super.key, required this.bookModel});
  final BookModel bookModel;
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
              url: bookModel.volumeInfo!.previewLink ?? 'None',
            );
          },
          fontSize: 16,
          text: getText(bookModel: bookModel),
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

String getText({required BookModel bookModel}) {
  if (bookModel.volumeInfo!.previewLink != null) {
    return 'Preview';
  } else {
    return 'Not Available!';
  }
}
