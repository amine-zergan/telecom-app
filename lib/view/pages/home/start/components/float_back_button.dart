import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../theme/color_constants.dart';

class BackFloatButton extends StatelessWidget {
  const BackFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      elevation: 15,
      onPressed: () {
        Get.back(result: 40.0);
      },
      child: const Icon(Icons.close, color: colorButton),
    );
  }
}
