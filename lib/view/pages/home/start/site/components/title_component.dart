import 'package:flutter/material.dart';

class SubTitleComponent extends StatelessWidget {
  const SubTitleComponent({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.labelLarge,
    );
  }
}
