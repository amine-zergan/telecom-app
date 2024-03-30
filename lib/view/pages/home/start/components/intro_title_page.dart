import 'package:flutter/material.dart';

class Introtitle extends StatelessWidget {
  const Introtitle({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            color: Colors.grey.shade600,
          ),
      textAlign: TextAlign.center,
    );
  }
}
