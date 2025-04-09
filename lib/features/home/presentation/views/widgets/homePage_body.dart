import 'package:book_app/core/utils/styles.dart';
import 'package:book_app/features/home/presentation/views/widgets/bestSeller_listview.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:book_app/features/home/presentation/views/widgets/custom_listviewHorizontal.dart';
import 'package:flutter/material.dart';

class HomepageBody extends StatelessWidget {
  const HomepageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      physics: const BouncingScrollPhysics(),
      
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppbar(),
                SizedBox(
                  height: 40,
                ),
                CustomListviewHorizontal(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Most Popular ',
                  style: Styles.textStyle20,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
        SliverList(
        
          delegate: SliverChildListDelegate([
            const Padding(
            padding: EdgeInsets.only(left: 26),
            child: BestSellerListview(),
          ),

          ])),
          
        
       
      ],
    );
  }
}
