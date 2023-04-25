import 'package:flutter/material.dart';
import 'package:telecom/view/pages/onboard/data_onboard.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.onbard,
  });

  final Onboard onbard;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        onbard.title,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
      ),
    );
  }
}
