// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print, unnecessary_overrides

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';
import 'package:telecom/view/pages/home/views/settings/reports/pv_reception/pv_page.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';
import 'package:telecom/view/pages/home/views/settings/reports/rapport_rfi/survey_site_controller.dart';

// ignore: must_be_immutable
class SurveySitePage extends GetWidget<SurveySiteController> {
  SurveySitePage({super.key});

  bool bracon = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.generateRfiReport();
        },
        elevation: 10,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.create,
        ),
      ),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
        title: Text(
          "Creation Rapport Qualité",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: Get.height,
          child: ListView(
            children: [
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: FormSiteComponent(
                  controller: controller.fieldSiteNom,
                  focusNode: controller.focusSite,
                  formStateKey: const Key(""),
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Text(
                  "Type de Site :",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return Wrap(
                    spacing: 10,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.white,
                        disabledColor: Colors.black38,
                        color: const MaterialStatePropertyAll(
                          Colors.black12,
                        ),
                        selectedColor: Colors.white,
                        label: const Text(
                          "Nodal",
                        ),
                        selected: controller.selectedsite == Site.nodal,
                        onSelected: (value) {
                          controller.updateSite(Site.nodal);
                        },
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.white,
                        disabledColor: Colors.black38,
                        color: const MaterialStatePropertyAll(
                          Colors.black12,
                        ),
                        selectedColor: Colors.white,
                        label: const Text(
                          "Aggreg",
                        ),
                        selected: controller.selectedsite == Site.agg,
                        onSelected: (value) {
                          controller.updateSite(Site.agg);
                        },
                      ),
                      ChoiceChip(
                        backgroundColor: Colors.white,
                        disabledColor: Colors.black38,
                        color: const MaterialStatePropertyAll(
                          Colors.black12,
                        ),
                        selectedColor: Colors.white,
                        label: const Text(
                          "Terminal",
                        ),
                        selected: controller.selectedsite == Site.ter,
                        onSelected: (value) {
                          controller.updateSite(Site.ter);
                        },
                      ),
                    ],
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey OutDoor :",
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,

                padding: const EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                //color: Colors.amber,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Metrage de Pylone",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: GetBuilder<SurveySiteController>(
                                builder: (controller) {
                              return Slider(
                                value: controller.pylone,
                                allowedInteraction:
                                    SliderInteraction.tapAndSlide,
                                min: 0,
                                max: 1,
                                label: "${controller.pylone.toInt()}",
                                onChanged: controller.upddateMetragePylone,
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 60,
                        margin: const EdgeInsets.only(
                          right: 15,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Center(
                          child: GetBuilder<SurveySiteController>(
                              builder: (controller) {
                            return Text(
                              "${(controller.pylone * 100).toInt()} m",
                              style: Theme.of(context).textTheme.titleMedium,
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 90,
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.only(left: 15),
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "Support Antenne",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: TextFormField(
                          controller: controller.fieldSupportAntenne,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: "commentaire",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GetBuilder<SurveySiteController>(
                builder: (conteroller) {
                  return ComponentItem(
                    title: "Support bracon si existe :",
                    isExist: controller.supportAntenne,
                    onChanged: controller.updateSupportAntenne,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Baterre de Terre No_01 :",
                    isExist: controller.barretteTerre,
                    onChanged: controller.updateBaretteTerre,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Tremie :",
                    isExist: controller.tremie,
                    onChanged: controller.updateTremie,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Chemin de cable V :",
                    isExist: controller.cheminV,
                    onChanged: controller.updateCheminV,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Chemin de cable H:",
                    isExist: controller.cheminH,
                    onChanged: controller.updateCheminH,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                    ),
                    child: TitleComponentTask(
                        title: "Selectionnez les images Outdoor",
                        isActive: controller.outdoorImage.isNotEmpty,
                        onTap: controller.getListImageFromGallerieoutdoorImage),
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return SizedBox(
                    width: double.infinity,
                    height: controller.outdoorImage.isEmpty ? 10 : 200,
                    child: controller.outdoorImage.isEmpty
                        ? Container()
                        : ListView.builder(
                            itemCount: controller.outdoorImage.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              File file = controller.outdoorImage[index];
                              return Container(
                                width: 150,
                                padding: const EdgeInsets.all(3),
                                child: Card(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      file,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: CardTitleClientInfo(
                  title: "Survey InDoor :",
                ),
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "BTS:",
                    isExist: controller.bts,
                    onChanged: controller.updateBts,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Chemin de cable ",
                    isExist: controller.cheminCable,
                    onChanged: controller.updateCheminCable,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Rack espace",
                    isExist: controller.rackEspace,
                    onChanged: controller.updateRackEsp,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "DC :",
                    isExist: controller.courantDc,
                    onChanged: controller.updateCourantDc,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "AC :",
                    isExist: controller.courantAc,
                    onChanged: controller.updateCourantAc,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "GND ",
                    isExist: controller.vertJaune,
                    onChanged: controller.updateGND,
                  );
                },
              ),
              GetBuilder<SurveySiteController>(
                builder: (controller) {
                  return ComponentItem(
                    title: "Clim ",
                    isExist: controller.clim,
                    onChanged: controller.updateClim,
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: TextFormField(
                  minLines: 1,
                  maxLines: 20,
                  controller: controller.fieldDetail,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(),
                    errorBorder: OutlineInputBorder(),
                    hintText: "Ajouter les details RFI...",
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GetBuilder<SurveySiteController>(builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: TitleComponentTask(
                    title: "Selectionnez les images indoor",
                    isActive: controller.indoorImage.isNotEmpty,
                    onTap: () {
                      controller.getListImageFromGallerieindoorImage();
                    },
                  ),
                );
              }),
              GetBuilder<SurveySiteController>(builder: (controller) {
                return SizedBox(
                  width: double.infinity,
                  height: controller.indoorImage.isEmpty ? 10 : 200,
                  child: controller.indoorImage.isEmpty
                      ? Container()
                      : ListView.builder(
                          itemCount: controller.indoorImage.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            File file = controller.indoorImage[index];
                            return Container(
                              width: 150,
                              padding: const EdgeInsets.all(3),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    file,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                );
              }),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ComponentItem extends StatelessWidget {
  const ComponentItem({
    Key? key,
    required this.title,
    required this.isExist,
    this.onChanged,
  }) : super(key: key);
  final String title;
  final bool isExist;
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 1),
      child: ListTile(
        title: Text(title),
        trailing: Checkbox(
          value: isExist,
          onChanged: onChanged,
        ),
      ),
      //color: Colors.amber,
      // child: Row(
      // children: [
      // Expanded(
      // flex: 3,
      // child: Text(
      // title,
      // ),
      // ),
      // Expanded(
      // child: Checkbox(
      // value: isExist,
      // onChanged: onChanged,
      // ),
      // )
      // ],
      // ),
    );
  }
}
