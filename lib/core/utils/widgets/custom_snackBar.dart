


import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, {required String message,required IconData? icon}) {
     AnimatedSnackBar(
                    mobileSnackBarPosition: MobileSnackBarPosition.top,
                    builder: ((context) {
                      return MaterialAnimatedSnackBar(
                        backgroundColor: Colors.grey.withOpacity(.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        iconData: icon,
                        messageText: '  $message',
                        messageTextStyle: const TextStyle(color: Colors.white),
                        type: AnimatedSnackBarType.success,
                        foregroundColor: Colors.red[900],
                      );
                    }),
                  ).show(context);
  }