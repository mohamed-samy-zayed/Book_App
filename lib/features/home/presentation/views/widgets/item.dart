import 'package:book_app/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.imageUrl});
  final String imageUrl;
  
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.4 / 4,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: CachedNetworkImage(imageUrl: imageUrl,
        fit: BoxFit.cover,
                 
        colorBlendMode: BlendMode.clear,
        errorWidget: (context, url, error) => Center(child:  Text('Not Found !',style: Styles.textStyle14.copyWith(color: Colors.black),textAlign: TextAlign.center,)),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),),
      ),
        
      
    );
  }
}
