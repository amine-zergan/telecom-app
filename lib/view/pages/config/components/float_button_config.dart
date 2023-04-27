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
      icon: controller.getLastPage()
          ? const Icon(Icons.done_all)
          : const Icon(Icons.arrow_circle_right),
      backgroundColor: Colors.white,
      label: Text(
        controller.getLastPage() ? "Done" : "Next",
      ),
    );
  }
}
