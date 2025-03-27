import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomFailuredialog extends StatelessWidget {
  const CustomFailuredialog({super.key, required this.erorrMessage});
  final String erorrMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(erorrMessage,style: Styles.textStyle18.copyWith(
        color: Colors.red,
      ),),
    );
    
    // AlertDialog(
    //   title: const Text(
    //     'Error',
    //     style: Styles.textStyle22,
    //   ),
    //   content: Text(
    //     erorrMessage,
    //     style: Styles.textStyle18,
    //   ),
    //   actions: [
    //     ElevatedButton(
    //         onPressed: () {
    //           GoRouter.of(context).pop();
    //         },
    //         style: ElevatedButton.styleFrom(
    //             backgroundColor: Colors.red[600],
    //             shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(15),
    //             )),
    //         child: const Text(
    //           'ok',
    //           style: Styles.textStyle18,
    //         ))
    //   ],
    // );
  }
}
