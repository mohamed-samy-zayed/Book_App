
import 'package:book_app/core/utils/app_route.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class SplashPageBody extends StatefulWidget {
  const SplashPageBody({super.key});

  @override
  State<SplashPageBody> createState() => _SplashPageBodyState();
}

class _SplashPageBodyState extends State<SplashPageBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidAnimation;

  @override
  void initState() {
    super.initState();
    initSlidAnimation();
 goToHome();
  }

  

  @override
  void dispose() { 
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Image.asset(AssetsImage.logo),
        ),
        const SizedBox(
          height: 5,
        ),
        AnimatedBuilder(
          animation: slidAnimation,
          builder: (context,_) {
            return SlideTransition(
              position: slidAnimation,
              child: const Text(
                'Read Free Books',
                textAlign: TextAlign.center,
              ),
            );
          }
        ),
      ],
    );
  }



  void initSlidAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    
    slidAnimation = Tween(begin: const Offset(0, 5), end: Offset.zero)
        .animate(animationController);
    animationController.forward();
  }

  void goToHome() {
    Future.delayed(const Duration(seconds: 2),(){
    GoRouter.of(context).push(AppRoute.kHomePath);
    }) ;
  }
}
