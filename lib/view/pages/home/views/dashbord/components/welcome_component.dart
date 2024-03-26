import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeDashBord extends StatelessWidget {
  const WelcomeDashBord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: size.height * 0.16,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Stack(
          children: [
            Positioned(
              right: -50,
              top: 10,
              bottom: 10,
              child: LottieBuilder.asset(
                "assets/animations/home.json",
                height: 70,
                repeat: false,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 10,
              top: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Amine Mejri",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Commencer A creer\nvotre Mission de cette \nSemaine ",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.black87,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
