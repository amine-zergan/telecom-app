import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class ContractPage extends StatefulWidget {
  const ContractPage({super.key});

  @override
  State<ContractPage> createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  int? selectedIndex;
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
          return CardChoix(
            index: index,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
                // ignore: avoid_print
                print(contrat);
              });
            },
            title: contrat,
          );
        }),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}
