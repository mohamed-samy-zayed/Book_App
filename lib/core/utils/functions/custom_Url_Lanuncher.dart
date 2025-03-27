import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customUrlLauncher({required context,required String url})async{

   final Uri _url = Uri.parse(url);
            if (await canLaunchUrl(_url)) {
              await launchUrl(_url);
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
             const   SnackBar(content: Text('Couldnot launch',style: Styles.textStyle20,))
              );
            }
}