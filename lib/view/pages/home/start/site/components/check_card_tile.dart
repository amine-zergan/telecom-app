import 'package:flutter/material.dart';
import 'package:telecom/view/theme/size_constants.dart';

import '../../../../../theme/color_constants.dart';

class CheckCardTile extends StatelessWidget {
  const CheckCardTile({
    Key? key,
    required this.value,
    this.onChanged,
  }) : super(key: key);

  final bool value;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: CheckboxListTile(
        value: value,
        activeColor: colorButton,
        side: const BorderSide(
          style: BorderStyle.solid,
        ),
        checkboxShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.only(left: padding10 / 2),
          child: Text(
            "Coordonnées depuis position Gps",
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
