import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/components/list_operator_card_view.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';

class ListOperatorWithController extends StatelessWidget {
  const ListOperatorWithController({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateSiteController controller;

  @override
  Widget build(BuildContext context) {
    return ListOperatorCard(
      selectedIndex: controller.selectedOperator,
      operators: controller.operators,
      onTap: controller.updateSelectedOperator,
    );
  }
}
