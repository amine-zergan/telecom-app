import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/equipements/controller/create_equipement_controller.dart';
import 'package:telecom/view/theme/color_constants.dart';

import '../../../../../../utils/converter/enum/indoor_outdoor_enum.dart';

class CardRadioTile extends StatelessWidget {
  const CardRadioTile({
    Key? key,
    required this.value,
    required this.title,
    required this.controller,
  }) : super(key: key);
  final Qualification value;
  final String title;
  final CreateEquipementController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile(
        title: Text(title),
        activeColor: colorButton,
        contentPadding: EdgeInsets.zero,
        value: value,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        groupValue: controller.groupValuePosition,
        onChanged: controller.onChanged,
      ),
    );
  }
}
