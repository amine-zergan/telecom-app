import 'package:get/get.dart';

import 'package:linearprogress/linearprogress.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';

import '../../../theme/size_constants.dart';

Future<dynamic> showDialogueImagePicker(
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
                controller.pickedImageCamera();
                Get.back();
              },
              title: const Text(
                "choisir image depuis Camera",
              ),
            ),
            ListTile(
              onTap: () {
                controller.pickedImageGalerie();
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
