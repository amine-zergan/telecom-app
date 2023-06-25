import 'package:flutter/material.dart';

import '../../../theme/color_constants.dart';

class StartedButton extends StatelessWidget {
  const StartedButton({
    Key? key,
    required this.press,
  }) : super(key: key);
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      key: const ValueKey("1"),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      onPressed: press,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      color: colorButton,
      child: Text(
        "Commencer",
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(color: Colors.white),
      ),
    );
  }
}
