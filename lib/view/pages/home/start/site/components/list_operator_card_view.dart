import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/components/operator_card.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/start/site/data/class_operator_model.dart';

import '../../../../../theme/size_constants.dart';

class ListOperatorCard extends StatelessWidget {
  const ListOperatorCard({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  final int? selectedIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleComponent(
          title: "Choisi l'Operateur :",
        ),
        Container(
          width: size.width,
          height: size.height * 0.1,
          margin: const EdgeInsets.only(top: padding10),
          child: Row(
            children: List.generate(dataOperator.length, (index) {
              OperatorEntity model = dataOperator[index];
              return OperatorCard(
                selectedIndex: selectedIndex,
                model: model,
                index: index,
                onTap: () {
                  onTap(index);
                  // ignore: avoid_print
                  print(model.name);
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
