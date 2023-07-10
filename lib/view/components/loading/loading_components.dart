import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: LottieBuilder.asset(
        "assets/animations/loading.json",
        width: size.width * 0.25,
        height: size.width * 0.25,
        repeat: true,
        alignment: Alignment.topCenter,
      ),
    );
  }
}
