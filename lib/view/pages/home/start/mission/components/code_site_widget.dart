import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';

class CodeSiteComponent extends StatelessWidget {
  const CodeSiteComponent({
    super.key,
    required this.controller,
  });
  final CreateMissionController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15.0,
      direction: Axis.horizontal,
      children: List<Widget>.generate(
        controller.codeSite.length,
        (int index) {
          final site = controller.codeSite[index];
          return Chip(
            label: Text(
              site,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onDeleted: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Text(
                      "voulez vous enlever $site depuis cette mission",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Retour"),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.updateNombreSiteRemove(index);
                          Get.back();
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  );
                },
              );
            },
            autofocus: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          );
        },
      ).toList(),
    );
  }
}
