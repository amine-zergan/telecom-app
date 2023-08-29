// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/report/qa.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';

class QualiteRapportPage extends StatefulWidget {
  const QualiteRapportPage({super.key});

  @override
  State<QualiteRapportPage> createState() => _QualiteRapportPageState();
}

class _QualiteRapportPageState extends State<QualiteRapportPage> {
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
                  site: "SFA_0245",
                  nom_pdf: "rapport-qualite-sfa-0245",
                  //file: image,
                );
                OpenFile.open(file.path);
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
                controller: TextEditingController(),
                focusNode: FocusNode(),
                hintText: "Site_0001",
                labelText: "Nom Site",
                onEditComplete: () {},
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
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Etiquetage de l'antenne/Câble IF",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Connection  ODU and Antenna",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Fixation et le positionnement du bracon si présence",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "IF Connector",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Présence de graisse sur les vis de réglage d'antenne",
                onTap: () {},
              ),
              TitleComponentTask(
                title:
                    "Présence de câble terre V/J sur le(s) radio(s) et Raccordement à la barette",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Etanchéité Kit masse raccordés à la barette de masse",
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
                onTap: () {},
              ),
              TitleComponentTask(
                title:
                    "Présence et  fonctionnement des disjoncteur -48v avec etiquetage",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Etiquetage du IDU ",
                onTap: () {},
              ),
              TitleComponentTask(
                title:
                    "Câblage et étiquetage des accés GE au mini répartiteur optique",
                onTap: () {},
              ),
              TitleComponentTask(
                title:
                    "Présence de câble terre V/J sur l'IDU et raccordement à la barrette de BTS",
                onTap: () {},
              ),
              TitleComponentTask(
                title: "Photo génerale (clean up site)",
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
  }) : super(key: key);
  final String title;
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
        trailing: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
