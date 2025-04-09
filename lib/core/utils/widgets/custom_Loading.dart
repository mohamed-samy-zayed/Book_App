import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key, required this.isHorizontal, this.height, this.width});
final bool isHorizontal;
final double? height,width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          scrollDirection:isHorizontal == true? Axis.horizontal: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            return  Cardloading(
              isHorizontal: isHorizontal ,
              height: height,
              width: width,
            );
          }),
    );
  }
}

class Cardloading extends StatelessWidget {
  const Cardloading({super.key, required this.isHorizontal, this.height, this.width});
final bool isHorizontal;
final double? height,width;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        spacing: 10,
        children: [
          CardLoading(
            height: height ??90,
            width: width?? 80,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            margin: const EdgeInsets.only(bottom: 30),
          ),
      
          isHorizontal == true ? const SizedBox(
            width: 1,
          ):
          const Expanded(
            child: CardLoading(
              height: 90,
              borderRadius: BorderRadius.all(Radius.circular(15)),
              margin: EdgeInsets.only(bottom: 30),
            ),
          ),
        ],
      ),
    );
  }
}
