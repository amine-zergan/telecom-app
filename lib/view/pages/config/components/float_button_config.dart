import 'package:flutter/material.dart';

import '../controller/config_controller.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ConfigController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: controller.navigatePageController,
      icon: controller.isLast
          ? const Icon(Icons.done_all)
          : const Icon(Icons.arrow_circle_right_outlined),
      backgroundColor: Colors.white,
      label: Text(
        controller.textButton,
      ),
    );
  }
}
