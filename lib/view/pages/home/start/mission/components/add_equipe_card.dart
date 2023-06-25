import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class AddColleguework extends StatelessWidget {
  const AddColleguework({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateMissionController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          showDialog(
              context: context,
              barrierColor: Colors.black26,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: Column(
                    children: [
                      const Text(
                        "Vos collegues en mission",
                      ),
                      const SizedBox(
                        height: padding10,
                      ),
                      CupertinoTextField(
                        controller: controller.fieldsEquipe,
                        autocorrect: false,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(
                        height: padding10,
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
                      onPressed: controller.updateNombreEquipeAdd,
                      child: const Text(
                        "Ajouter",
                      ),
                    ),
                  ],
                );
              });
        },
        icon: const Icon(
          Icons.add_home_sharp,
        ),
        label: const Text(
          "Ajouter equipe",
        ),
      ),
    );
  }
}
