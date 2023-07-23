import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/view/pages/home/views/navigation/components/blur_effect_image.dart';
import 'package:telecom/view/theme/size_constants.dart';

class BackgroundAppBar extends StatelessWidget {
  const BackgroundAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      background: Stack(
        fit: StackFit.expand,
        children: [
          LottieBuilder.asset(
            "assets/animations/maps.json",
            fit: BoxFit.cover,
          ),
          const BlurEffectIamge(),
        ],
      ),
      expandedTitleScale: 1.5,
      title: const Text(
        "Navigation",
      ),
      titlePadding: const EdgeInsets.only(
        bottom: padding10,
        left: padding10,
      ),
      centerTitle: false,
      collapseMode: CollapseMode.none,
    );
  }
}
