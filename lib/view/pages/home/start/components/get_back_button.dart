import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetBackButton extends StatelessWidget {
  const GetBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 20,
      ),
      splashRadius: 20,
    );
  }
}
