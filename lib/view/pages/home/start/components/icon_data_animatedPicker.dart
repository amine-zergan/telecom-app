// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IconDateWidget extends StatelessWidget {
  const IconDateWidget({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LottieBuilder.asset(
          "assets/animations/calender.json",
          width: 30,
        ),
      ),
    );
  }
}
