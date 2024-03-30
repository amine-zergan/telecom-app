import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/equipements/components/card_list_tile.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import '../../../../../../helpers/utils/converter/enum/indoor_outdoor_enum.dart';
import '../../../../../theme/size_constants.dart';
import '../controller/create_equipement_controller.dart';

class RadioTileInstallationEquipement extends StatelessWidget {
  const RadioTileInstallationEquipement({
    super.key,
    required this.controller,
  });
  final CreateEquipementController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleComponent(
          title: "Installation d'equipement :",
        ),
        const SizedBox(
          height: padding10,
        ),
        CardRadioTile(
          value: Qualification.indoor,
          title: "Indoor",
          controller: controller,
        ),
        CardRadioTile(
          value: Qualification.outdoor,
          title: "Outdoor",
          controller: controller,
        ),
        const SizedBox(
          height: padding10,
        ),
      ],
    );
  }
}
