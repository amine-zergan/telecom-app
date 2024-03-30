import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/components/check_card_tile.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';

class CheckCardWithController extends StatelessWidget {
  const CheckCardWithController({
    super.key,
    required this.controller,
  });
  final CreateSiteController controller;

  @override
  Widget build(BuildContext context) {
    return CheckCardTile(
      value: controller.activeCheckBox,
      onChanged: controller.updateCheckBox,
    );
  }
}
