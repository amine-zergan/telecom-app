// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class DropDownRegionWithcontroller extends StatelessWidget {
  const DropDownRegionWithcontroller({
    super.key,
    required this.controller,
  });

  final CreateTaskController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: padding10,
        ),
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
            menuStyle: const MenuStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.white,
              ),
            ),
            leadingIcon: const Icon(
              Icons.place,
            ),
            enableSearch: true,
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
        controller.errorRegion == ""
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: padding10,
                  ),
                  Text(
                    controller.errorRegion,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
      ],
    );
  }
}
