import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class SalairePage extends StatefulWidget {
  const SalairePage({super.key});

  @override
  State<SalairePage> createState() => _SalairePageState();
}

class _SalairePageState extends State<SalairePage> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
            title: "Quelle est votre Salaire dans cette entreprise ?"),
        Wrap(
          spacing: 15.0,
          direction: Axis.horizontal,
          children: List<Widget>.generate(
            salaire.length,
            (int index) {
              final price = salaire[index];
              return ChoiceChip(
                label: Text(
                  price,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                selected: selectedIndex == index,
                selectedColor: Colors.grey.shade500,
                autofocus: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                onSelected: (bool selected) {
                  setState(() {
                    selectedIndex = selected ? index : null;
                  });
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
