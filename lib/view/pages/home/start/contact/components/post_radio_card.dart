import 'package:flutter/material.dart';

import '../../../../../theme/color_constants.dart';
import '../../../../../theme/size_constants.dart';
import '../controller/contact_controller.dart';

class PostRadioTileCard extends StatelessWidget {
  const PostRadioTileCard({
    Key? key,
    required this.model,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final String model;
  final CreateContactController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: controller.selectValue == index
          ? Colors.grey.shade800
          : Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          padding10 / 2,
        ),
      ),
      child: RadioListTile(
        activeColor: colorButton,
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            padding10 / 2,
          ),
        ),
        value: model,
        groupValue: controller.post,
        selectedTileColor: controller.selectValue == index
            ? Colors.grey.shade800
            : Colors.transparent,
        title: Text(
          model,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: controller.selectValue == index
                    ? Colors.white
                    : Colors.grey,
              ),
        ),
        onChanged: (value) {
          controller.onChanged(value, index);
        },
      ),
    );
  }
}
