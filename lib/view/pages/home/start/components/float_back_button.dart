import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackFloatButton extends StatelessWidget {
  const BackFloatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color.fromARGB(255, 0, 51, 145),
      elevation: 15,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      onPressed: () {
        Get.back();
      },
      child: const Icon(Icons.close, color: Colors.white),
    );
  }
}
