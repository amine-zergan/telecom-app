import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class ContractPage extends StatelessWidget {
  const ContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
          title: "Quel est le type de votre contrat de travail ?",
        ),
        ...List.generate(contract.length, (index) {
          String contrat = contract[index];
          return GetBuilder<ConfigController>(builder: (controller) {
            return CardChoix(
              index: index,
              selectedIndex: controller.selectContrat,
              onTap: () {
                controller.updateContrat(index, contrat);
              },
              title: contrat,
            );
          });
        }),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}
