// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/data/entreprise_data.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class TaillePage extends StatelessWidget {
  const TaillePage({
    super.key,
    required this.controller,
  });
  final ConfigController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
          title: "Quel est la taille de votre Entreprise ?",
        ),
        ...List.generate(taille.length, (index) {
          String model = taille[index];
          return CardChoix(
            index: index,
            selectedIndex: controller.selectTaille,
            onTap: () {
              controller.updateTailleEntreprise(index, model);
            },
            title: model,
          );
        }),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}
