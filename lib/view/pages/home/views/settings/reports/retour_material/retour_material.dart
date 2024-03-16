import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/model/components/project/project_model.dart';
import 'package:telecom/report/dpm_drm-report.dart';
import 'package:telecom/report/models/article_model.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';
import 'package:telecom/view/pages/home/views/settings/reports/retour_material/retour_materiel_controller.dart';

class RetourMaterialPage extends GetWidget<RetourMaterielController> {
  const RetourMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final file = await LivraisonReport.generatePdf(
            title: "DRM site ${controller.fieldNomSite.text}",
            articles: List.generate(
              controller.materiels.length,
              (index) => Article(
                name: controller.materiels[index],
                fournisseur: controller.project?.name ?? "",
                quantite: 1,
              ),
            ),
            operator: controller.operator?.operator ?? "",
            destination: "Depot Cometel",
            ref: "",
            demandeur: "Cometel",
            nom_pdf: "DRM site ${controller.fieldNomSite.text}",
          );
          await OpenFile.open(file.path);
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.file_open,
        ),
      ),
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
              const SizedBox(
                height: 5,
              ),
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                title: const Text(
                  "Date démontage",
                ),
                trailing: GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );
                  },
                  child: const Icon(
                    Icons.calendar_month,
                  ),
                ),
              ),
              GetBuilder<RetourMaterielController>(builder: (conteroller) {
                return SizedBox(
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
                onTap: () {
                  //showLicensePage(context: context);
                  showModalBottomSheet(
                    context: context,
                    isDismissible: true,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    builder: (context) {
                      return GetBuilder<RetourMaterielController>(
                          builder: (controller) {
                        return Container(
                          width: double.infinity,
                          height: 600,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: ListView.builder(
                            itemCount: controller.choixMateriel.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              final item = controller.choixMateriel[index];
                              return ListTile(
                                title: Text(
                                  item,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Colors.black),
                                ),
                                trailing: Checkbox(
                                  value: controller.isContain(item),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                  onChanged: (value) {
                                    controller.updateListRetourMateriel(item);
                                  },
                                ),
                                onTap: () {
                                  controller.updateListRetourMateriel(item);
                                },
                              );
                            },
                          ),
                        );
                      });
                    },
                  );
                },
              ),
              GetBuilder<RetourMaterielController>(builder: (controller) {
                return controller.materiels.isEmpty
                    ? Container()
                    : ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 0,
                        ),
                        title: Text(
                          "Article",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      );
              }),
              GetBuilder<RetourMaterielController>(builder: (controller) {
                return controller.materiels.isEmpty
                    ? Container()
                    : SizedBox(
                        width: double.infinity,
                        height: Get.height * 0.5,
                        child: ListView.builder(
                          itemCount: controller.materiels.length,
                          itemBuilder: (context, index) {
                            final article = controller.materiels[index];
                            return Card(
                              child: ListTile(
                                title: Text(
                                  article,
                                  style: Theme.of(context).textTheme.labelLarge,
                                ),
                              ),
                            );
                          },
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
