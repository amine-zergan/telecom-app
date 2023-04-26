import 'package:flutter/material.dart';
import 'package:telecom/data/entreprise_data.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class TaillePage extends StatefulWidget {
  const TaillePage({super.key});

  @override
  State<TaillePage> createState() => _TaillePageState();
}

class _TaillePageState extends State<TaillePage> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
          title: "Quel est la taille de l'entreprise ?",
        ),
        ...List.generate(taille.length, (index) {
          String model = taille[index];
          return CardChoix(
            index: index,
            selectedIndex: selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
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
