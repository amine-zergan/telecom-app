import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.press,
  }) : super(key: key);
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: press,
      splashColor: Colors.transparent,
      splashRadius: 20,
      icon: const Icon(
        Icons.check,
      ),
    );
  }
}
