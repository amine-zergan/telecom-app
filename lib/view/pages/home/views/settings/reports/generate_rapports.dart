// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:telecom/report/pv_install.dart';
import 'package:telecom/view/pages/home/start/components/get_back_button.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';
import 'package:telecom/view/pages/home/views/settings/reports/retour_material/retour_material.dart';

class GenerateRapport extends StatelessWidget {
  const GenerateRapport({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: const GetBackButton(),
        title: Text(
          "Generer Rapports",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            padding: const EdgeInsets.only(
              right: 15.0,
              left: 15.0,
              top: 15.0,
            ),
            children: [
              CardTitle(
                title: "Cloture Mission",
                press: () {},
              ),
              CardTitle(
                title: "Demande Preparation materials ",
                press: () {},
              ),
              CardTitle(
                title: "Creer Demande Retour Materials",
                press: () {
                  Get.to(
                    () => const RetourMaterial(),
                  );
                },
              ),
              CardTitle(
                title: "Rapport Qualité ",
                press: () {
                  Get.to(
                    () => const QualiteRapportPage(),
                  );
                },
              ),
              CardTitle(
                title: "Site Survey",
                press: () {},
              ),
              CardTitle(
                title: "Pv de Reception B2B",
                press: () async {
                  final file = await PvInstall.generatePdf(
                    technicien: "Amine Mejri ",
                    contact: "54 948 198",
                    b2b: "AIR Liquide",
                    address: "10 rue egypte tounes",
                    responsable: "Amine mejri",
                    contactClient: "54 948 198 - 71 542 198",
                    debit: 200,
                  );
                  await OpenFile.open(file.path);
                },
              ),
              CardTitle(
                title: "Pv de Demontage B2B",
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  const CardTitle({
    Key? key,
    required this.press,
    required this.title,
  }) : super(key: key);
  final VoidCallback press;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 5.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: ListTile(
        onTap: press,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        title: Text(
          title,
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
        ),
      ),
    );
  }
}
