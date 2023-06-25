import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/theme/size_constants.dart';

class AddSiteComponent extends StatelessWidget {
  const AddSiteComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateMissionController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleComponent(
          title: "Codes sites :",
        ),
        TextButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                barrierColor: Colors.black26,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Column(
                      children: [
                        const Text(
                          "Ajouter les code sites ",
                        ),
                        const SizedBox(
                          height: padding10,
                        ),
                        CupertinoTextField(
                          controller: controller.fieldsNomCodeSite,
                          autocorrect: false,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Retour",
                        ),
                      ),
                      TextButton(
                        onPressed: controller.updateNombreSiteAdd,
                        child: const Text(
                          "Ajouter",
                        ),
                      ),
                    ],
                  );
                });
          },
          icon: const Icon(Icons.add),
          label: const Text("Ajouter"),
        )
      ],
    );
  }
}
