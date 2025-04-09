import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class PriceRatingItem extends StatelessWidget {
  const PriceRatingItem({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count, required this.detail,
  });
  final MainAxisAlignment mainAxisAlignment;
  
  final num rating,count;
  final bool detail;
  @override

  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: mainAxisAlignment,
      children: [
       getStars() ,
        const SizedBox(
          width: 6.3,
        ),
        Text(
          rating.toString(),
          style: Styles.textStyle18,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          '($count)',
          style: Styles.textStyle14.copyWith(color: const Color(0xff707070)),
        )
      ],
    );
  }

 Widget getStars(){
    if (detail == true) {
  if(rating == 0){
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
            Icons.star_rounded,
            color: Colors.grey,
          ),Icon(
            Icons.star_rounded,
            color: Colors.grey,
          ),Icon(
            Icons.star_rounded,
            color: Colors.grey,
          ),Icon(
            Icons.star_rounded,
            color: Colors.grey,
          ),Icon(
            Icons.star_rounded,
            color: Colors.grey,
          ),
      ],
    );
  }else if( 4.0 <= rating  && rating <= 4.5){
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.grey,
          ),
      ],
    );
  }else if( 4.5 < rating  && rating <= 5){
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          ),
      ],
    );
  }
}else{
    if (rating != 0) {
  return const Icon(
          Icons.star_rounded,
          color: Colors.yellow,
        );
}else{
  return const Icon(
          Icons.star_rounded,
          color: Colors.grey,
        );
}
  }
  return const Icon(
            Icons.star_rounded,
            color: Colors.yellow,
          );
  }
}
