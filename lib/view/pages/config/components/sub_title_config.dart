// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SubtitleConfig extends StatelessWidget {
  const SubtitleConfig({
    Key? key,
    required this.title,
    this.textAlign,
  }) : super(key: key);
  final String title;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
      textAlign: textAlign,
    );
  }
}
