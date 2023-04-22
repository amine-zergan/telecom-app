import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:telecom/view/pages/onboard/data_onboard.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.onbard,
  });

  final Onboard onbard;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 4,
      child: SvgPicture.asset(onbard.image),
    );
  }
}
