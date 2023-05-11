import 'package:flutter/material.dart';
import 'package:telecom/data/task_data.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownTaskMenu extends StatelessWidget {
  const DropdownTaskMenu({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final CreateTaskController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownMenu(
        hintText: "type de tache :",
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.grey.shade800,
          ),
        ),
        leadingIcon: const Icon(
          Icons.work_outline,
        ),
        enableFilter: true,
        width: size.width * 0.8,
        onSelected: controller.updateRegion,
        dropdownMenuEntries: tasksData
            .map(
              (element) => DropdownMenuEntry(
                value: element,
                label: element,
              ),
            )
            .toList(),
      ),
    );
  }
}
