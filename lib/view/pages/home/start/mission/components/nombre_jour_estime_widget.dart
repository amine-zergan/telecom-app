import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/helpers/utils/converter/week_day_integer_convertor.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/theme/size_constants.dart';

class NombreJourEstime extends StatelessWidget {
  const NombreJourEstime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleComponent(
          title: "Nombre de jour estimé :",
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
          ),
          child: GetBuilder<CreateMissionController>(
            builder: (controller) {
              return DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.all(padding10 / 2),
                  child: DropdownButton<int>(
                    borderRadius: BorderRadius.circular(10),
                    alignment: Alignment.topCenter,
                    value: controller.nombreJour,
                    isDense: true,
                    dropdownColor: Colors.grey.shade900,
                    itemHeight: 50,
                    elevation: 0,
                    onChanged: controller.onChangeJour,
                    items: controller.jourMission
                        .map(
                          (jour) => DropdownMenuItem(
                            value: JourConvertor.convertJourMission(jour),
                            child: Text(
                              jour,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
