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

  final _myListKeyOutDoor = GlobalKey<AnimatedListState>();

  final _myListKeyIndoor = GlobalKey<AnimatedListState>();

  void deleteItemdeleteoutdoorImage(
      int index, file, SurveySiteController controller) {
    controller.deleteoutdoorImage(index);
    _myListKeyOutDoor.currentState!.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: ImageItemWidget(
          file: file,
          index: index,
        ),
      ),
    );
  }

  void deleteItemdeleteindoorImage(
      int index, file, SurveySiteController controller) {
    controller.deleteindoorImage(index);
    _myListKeyIndoor.currentState!.removeItem(
      index,
      (context, animation) => FadeTransition(
        opacity: animation,
        child: ImageItemWidget(
          file: file,
          index: index,
        ),
      ),
    );
  }

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
                  formStateKey: controller.formKey,
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
              const MetragePyloneWidget(),
              SupportAntenneFieldWidget(controller: controller),
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
                        : AnimatedList(
                            key: _myListKeyOutDoor,
                            initialItemCount: controller.outdoorImage.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index, animation) {
                              File file = controller.outdoorImage[index];
                              return FadeTransition(
                                opacity: animation,
                                child: ImageItemWidget(
                                  file: file,
                                  index: index,
                                  onTap: () {
                                    deleteItemdeleteoutdoorImage(
                                        index, file, controller);
                                  },
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
                      : AnimatedList(
                          key: _myListKeyIndoor,
                          initialItemCount: controller.indoorImage.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index, animation) {
                            File file = controller.indoorImage[index];
                            return FadeTransition(
                              opacity: animation,
                              child: ImageItemWidget(
                                file: file,
                                index: index,
                                onTap: () {
                                  deleteItemdeleteindoorImage(
                                      index, file, controller);
                                },
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

class ImageItemWidget extends StatelessWidget {
  const ImageItemWidget({
    Key? key,
    required this.file,
    required this.index,
    this.onTap,
  }) : super(key: key);

  final File file;
  final int index;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key("$index"),
      width: 150,
      padding: const EdgeInsets.all(3),
      child: Stack(
        children: [
          Card(
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.file(
                file,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: GestureDetector(
              onTap: onTap,
              child: const Icon(
                Icons.delete_outline_sharp,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SupportAntenneFieldWidget extends StatelessWidget {
  const SupportAntenneFieldWidget({
    super.key,
    required this.controller,
  });

  final SurveySiteController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class MetragePyloneWidget extends StatelessWidget {
  const MetragePyloneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  child:
                      GetBuilder<SurveySiteController>(builder: (controller) {
                    return Slider(
                      value: controller.pylone,
                      allowedInteraction: SliderInteraction.tapAndSlide,
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
                child: GetBuilder<SurveySiteController>(builder: (controller) {
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
