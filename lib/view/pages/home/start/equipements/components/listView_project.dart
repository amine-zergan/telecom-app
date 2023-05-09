// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/equipements/components/card_fournisseur.dart';
import 'package:telecom/view/pages/home/start/equipements/controller/create_equipement_controller.dart';
import '../../../../../../model/components/project/project_model.dart';

class ListViewFournisseur extends StatelessWidget {
  const ListViewFournisseur({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateEquipementController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.09,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: controller.dataFromDb.length,
        itemBuilder: ((context, index) {
          Project project = controller.dataFromDb[index];
          return CardFournisseur(
            project: project,
            index: index,
            selectedProject: controller.selectedProject,
            onTap: controller.onChangedValue,
          );
        }),
      ),
    );
  }
}
