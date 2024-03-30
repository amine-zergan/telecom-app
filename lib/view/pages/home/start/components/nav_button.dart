import 'package:flutter/material.dart';

import '../../../../theme/color_constants.dart';
import '../../../../theme/size_constants.dart';

class CreateNavButton extends StatelessWidget {
  const CreateNavButton({
    super.key,
    required this.press,
    required this.title,
  });

  final VoidCallback press;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return MaterialButton(
      onPressed: press,
      padding: const EdgeInsets.symmetric(vertical: padding10 / 2),
      minWidth: size.width * 0.3,
      color: Colors.white,
      splashColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 5,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: colorButton.withOpacity(1),
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
