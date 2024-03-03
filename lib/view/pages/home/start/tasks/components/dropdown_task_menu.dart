import 'package:flutter/material.dart';
import 'package:telecom/data/task_data.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownTaskMenu extends StatelessWidget {
  final CreateTaskController controller;

  const DropdownTaskMenu({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DropdownButtonHideUnderline(
      child: DropdownMenu(
        hintText: "type de tache :",
        menuStyle: const MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.white,
          ),
        ),
        leadingIcon: const Icon(
          Icons.work_outline,
        ),
        enableSearch: true,
        enabled: true,
        width: size.width * 0.8,
        onSelected: controller.updateTask,
        dropdownMenuEntries: tasksData
            .map(
              (element) => DropdownMenuEntry(
                value: element,
                label: element,
                enabled: true,
              ),
            )
            .toList(),
      ),
    );
  }
}
