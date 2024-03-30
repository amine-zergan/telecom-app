import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';

class DeplacementTileCheckYesNo extends StatelessWidget {
  const DeplacementTileCheckYesNo({
    super.key,
    required this.controller,
  });
  final CreateMissionController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleComponent(
          title: "Mission en deplacement ?",
        ),
        Row(
          children: [
            TextButton(
              onPressed: controller.updatetoggleDeplacementTrueValue,
              child: const Text(
                "oui",
              ),
            ),
            TextButton(
              onPressed: controller.updatetoggleDeplacementFalseValue,
              child: const Text(
                "Non",
              ),
            )
          ],
        )
      ],
    );
  }
}
