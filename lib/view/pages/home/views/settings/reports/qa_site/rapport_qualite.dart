// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qa_controller.dart';

class QualiteRapportPage extends GetWidget<QaController> {
  const QualiteRapportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.generateQaRapport();
        },
        elevation: 10,
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.create_new_folder_outlined,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Creation Rapport Qualité",
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: GetBuilder<QaController>(
          builder: (controller) {
            return SizedBox(
              width: size.width,
              height: size.height,
              child: ListView(
                padding: const EdgeInsets.all(15.0),
                children: [
                  Text(
                    "Ajouter Code Site :",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Form(
                    key: controller.formvalidation,
                    child: NomFormField(
                      controller: controller.nomSiteField,
                      focusNode: controller.nomSite,
                      hintText: "Site_0001",
                      labelText: "Nom Site",
                      onEditComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      suffix: InkWell(
                        onTap: () {
                          controller.nomSiteField.clear();
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.length < 3) {
                          return "merci de saisi le nom de Site";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Installation OutDoor :",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TitleComponentTask(
                    title: "Positionnement de l'antenne dans le pylône",
                    isActive: controller.antennePosition == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageAntennPosition();
                    },
                  ),
                  TitleComponentTask(
                    title: "Etiquetage de l'antenne/Câble IF",
                    isActive: controller.etiquetageCoax == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageetiquetageCoax();
                    },
                  ),
                  TitleComponentTask(
                    title: "Connection  ODU and Antenna",
                    isActive: controller.oduFile == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageoduFile();
                    },
                  ),
                  TitleComponentTask(
                    title:
                        "Fixation et le positionnement du bracon si présence",
                    isActive: controller.braconAntenne == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImagebraconAntenne();
                    },
                  ),
                  TitleComponentTask(
                    title: "IF Connector",
                    isActive:
                        controller.etiquetageAntenneIf == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageetiquetageAntenneIf();
                    },
                  ),
                  TitleComponentTask(
                    title:
                        "Présence de graisse sur les vis de réglage d'antenne",
                    isActive:
                        controller.graisseSupportAntenne == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImagegraisseSupportAntenne();
                    },
                  ),
                  TitleComponentTask(
                    title:
                        "Présence de câble terre V/J sur le(s) radio(s) et Raccordement à la barette",
                    isActive: controller.etiquetageTerre == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageetiquetageTerre();
                    },
                  ),
                  TitleComponentTask(
                    title:
                        "Etanchéité Kit masse raccordés à la barette de masse",
                    isActive: false,
                    onTap: () {},
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "Installation InDoor :",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  TitleComponentTask(
                    title: "Emplacement de l'IDU dans le rack ou APM",
                    isActive: controller.iduDansRack == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageiduDansRack();
                    },
                  ),
                  TitleComponentTask(
                    title:
                        "Présence et  fonctionnement des disjoncteur -48v avec etiquetage",
                    onTap: () async {
                      await controller.picFileFromImageenergie();
                    },
                    isActive: controller.energie == null ? false : true,
                  ),
                  TitleComponentTask(
                    title: "Etiquetage du IDU ",
                    isActive: controller.etiquetageIdu == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageetiquetageIdu();
                    },
                  ),
                  TitleComponentTask(
                    isActive: controller.etiquetageFo == null ? false : true,
                    title:
                        "Câblage et étiquetage des accés GE au mini répartiteur optique",
                    onTap: () async {
                      await controller.picFileFromImageetiquetageFo();
                    },
                  ),
                  TitleComponentTask(
                    isActive:
                        controller.etiquetageIduGenerale == null ? false : true,
                    title:
                        "Présence de câble terre V/J sur l'IDU et raccordement à la barrette de BTS",
                    onTap: () async {
                      await controller.picFileFromImageetiquetageIduGenerale();
                    },
                  ),
                  TitleComponentTask(
                    title: "Photo génerale (clean up site)",
                    isActive: controller.cleanUp == null ? false : true,
                    onTap: () async {
                      await controller.picFileFromImageCleanUp();
                    },
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class TitleComponentTask extends StatelessWidget {
  const TitleComponentTask({
    Key? key,
    required this.title,
    this.onTap,
    required this.isActive,
  }) : super(key: key);
  final String title;
  final bool isActive;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            color: isActive ? Colors.green.shade400 : Colors.transparent,
          )),
      child: ListTile(
          onTap: onTap,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          trailing: const Icon(
            Icons.add,
            size: 20,
          )),
    );
  }
}
