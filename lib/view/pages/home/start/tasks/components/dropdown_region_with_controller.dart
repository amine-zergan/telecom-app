import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class DropDownRegionWithcontroller extends StatelessWidget {
  const DropDownRegionWithcontroller({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);
  final Size size;
  final CreateTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubTitleComponent(
          title: "Region :",
        ),
        const SizedBox(
          height: padding10,
        ),
        DropdownButtonHideUnderline(
          child: DropdownMenu(
            hintText: "choisir la region ",
            width: size.width * 0.8,
            menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.grey.shade800,
              ),
            ),
            //controller: taskfields,
            leadingIcon: const Icon(
              Icons.place,
            ),
            enableFilter: true,
            onSelected: controller.updateRegion,
            dropdownMenuEntries: region
                .map(
                  (element) => DropdownMenuEntry(
                    value: element,
                    label: element,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
