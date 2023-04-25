import 'package:flutter/material.dart';
import 'package:telecom/view/pages/onboard/data_onboard.dart';

class SubTitleWidget extends StatelessWidget {
  const SubTitleWidget({
    super.key,
    required this.onbard,
  });

  final Onboard onbard;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        onbard.description,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            letterSpacing: 0.7,
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade50),
      ),
    );
  }
}
