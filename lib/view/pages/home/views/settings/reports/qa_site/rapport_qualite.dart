// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/report/qa.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qa_controller.dart';

class QualiteRapportPage extends GetWidget<QaController> {
  const QualiteRapportPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Creation Rapport ",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            child: GestureDetector(
              onTap: () async {
                final file = await QaReport.generatePdf(
                  site: controller.nomSiteField.text.toUpperCase(),
                  nom_pdf: "rapport-qualite-sfa-0245",
                  //file: image,
                );
                await OpenFile.open(file.path);
              },
              child: const Icon(
                Icons.document_scanner_outlined,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
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
              NomFormField(
                controller: controller.nomSiteField,
                focusNode: controller.nomSite,
                hintText: "Site_0001",
                labelText: "Nom Site",
                onEditComplete: () {
                  FocusScope.of(context).unfocus();
                },
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
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Etiquetage de l'antenne/Câble IF",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Connection  ODU and Antenna",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Fixation et le positionnement du bracon si présence",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title: "IF Connector",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Présence de graisse sur les vis de réglage d'antenne",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title:
                    "Présence de câble terre V/J sur le(s) radio(s) et Raccordement à la barette",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Etanchéité Kit masse raccordés à la barette de masse",
                isActive: true,
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
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                title:
                    "Présence et  fonctionnement des disjoncteur -48v avec etiquetage",
                onTap: () {},
                isActive: true,
              ),
              TitleComponentTask(
                title: "Etiquetage du IDU ",
                isActive: true,
                onTap: () {},
              ),
              TitleComponentTask(
                isActive: true,
                title:
                    "Câblage et étiquetage des accés GE au mini répartiteur optique",
                onTap: () {},
              ),
              TitleComponentTask(
                isActive: true,
                title:
                    "Présence de câble terre V/J sur l'IDU et raccordement à la barrette de BTS",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Photo génerale (clean up site)",
                isActive: true,
                onTap: () {},
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        trailing: isActive
            ? const Icon(
                Icons.add,
                size: 20,
              )
            : const Icon(
                Icons.close,
                size: 20,
              ),
      ),
    );
  }
}
