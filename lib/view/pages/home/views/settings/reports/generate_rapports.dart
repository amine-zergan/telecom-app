// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:telecom/view/pages/home/start/components/get_back_button.dart';
import 'package:telecom/view/pages/home/views/settings/reports/qa_site/rapport_qualite.dart';

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
                press: () {},
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
