import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../theme/size_constants.dart';
import '../controller/config_controller.dart';

Future<dynamic> showDialogueImagePickerProfileEntreprise(
    BuildContext context, ConfigController controller) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        margin: const EdgeInsets.only(bottom: padding10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                controller.pickedImageCameraEntreprise();
                Get.back();
              },
              title: const Text(
                "choisir image depuis Camera",
              ),
            ),
            ListTile(
              onTap: () {
                controller.pickedImageGalerieEntreprise();
                Get.back();
              },
              title: const Text(
                "choisir image depuis Galerie",
              ),
            ),
          ],
        ),
      );
    },
  );
}
