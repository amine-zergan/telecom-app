// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/model/components/project/operator_model.dart';
import 'package:telecom/view/pages/home/start/site/components/operator_card.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import '../../../../../theme/size_constants.dart';

class ListOperatorCard extends StatelessWidget {
  const ListOperatorCard({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
    required this.operators,
  }) : super(key: key);

  final int? selectedIndex;
  final Function(int) onTap;
  final List<Operator> operators;

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
            children: List.generate(operators.length, (index) {
              Operator model = operators[index];
              return OperatorCard(
                selectedIndex: selectedIndex,
                model: model,
                index: index,
                onTap: () {
                  onTap(index);
                },
              );
            }),
          ),
        ),
      ],
    );
  }
}
