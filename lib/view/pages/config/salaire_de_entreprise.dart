// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class SalairePage extends StatelessWidget {
  const SalairePage({
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
                selected: controller.selectSalaire == index,
                selectedColor: Colors.grey.shade500,
                autofocus: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                onSelected: (bool selected) {
                  controller.updateSalaire(index, price, selected);
                },
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}
