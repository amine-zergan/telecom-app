import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';
import 'package:telecom/view/pages/home/views/settings/reports/retour_material/retour_materiel_controller.dart';

class RetourMaterialPage extends GetWidget<RetourMaterielController> {
  const RetourMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Demande Retour Material",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: Get.height,
          child: ListView(
            padding: const EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
            ),
            children: [
              FormSiteComponent(
                controller: controller.fieldNomSite,
                focusNode: controller.focusSite,
                formStateKey: controller.formkeySite,
                onTap: () {},
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                title: const Text(
                  "date démontage",
                ),
                trailing: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );
                  },
                  child: Icon(
                    Icons.calendar_month,
                  ),
                ),
              ),
              GetBuilder<RetourMaterielController>(builder: (conteroller) {
                return Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "operateur",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Operator>(
                            value: controller.operator,
                            elevation: 2,
                            iconSize: 25,
                            hint: Text(controller
                                .setting.dataOperators.first.operator),
                            borderRadius: BorderRadius.circular(10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            items: controller.setting.dataOperators
                                .map(
                                  (e) => DropdownMenuItem<Operator>(
                                    value: e,
                                    child: Text(
                                      e.operator,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: controller.updateOperator,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              GetBuilder<RetourMaterielController>(builder: (conteroller) {
                return Container(
                  width: double.infinity,
                  height: 50,
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Fournisseur",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<Project>(
                            value: controller.project,
                            elevation: 2,
                            iconSize: 25,
                            hint: Text(
                              controller.setting.dataFromDb.first.name,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            items: controller.setting.dataFromDb
                                .map(
                                  (e) => DropdownMenuItem<Project>(
                                    value: e,
                                    child: Text(
                                      e.name,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: controller.updateProject,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(
                height: 10,
              ),
              TitleComponentTask(
                title: "Ajouter la Liste de materiel demonté",
                isActive: false,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
