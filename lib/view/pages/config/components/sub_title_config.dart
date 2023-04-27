import 'package:flutter/material.dart';

class SubtitleConfig extends StatelessWidget {
  const SubtitleConfig({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
      textAlign: TextAlign.center,
    );
  }
}
