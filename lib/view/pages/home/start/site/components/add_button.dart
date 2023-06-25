// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  AddButton({Key? key, required this.press, this.icon = Icons.check})
      : super(key: key);
  final VoidCallback press;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: press,
      splashColor: Colors.transparent,
      splashRadius: 20,
      icon: Icon(
        icon,
      ),
    );
  }
}
