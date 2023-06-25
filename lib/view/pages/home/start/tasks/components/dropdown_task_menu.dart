import 'package:flutter/material.dart';
import 'package:telecom/data/task_data.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownTaskMenu extends StatefulWidget {
  const DropdownTaskMenu({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final CreateTaskController controller;

  @override
  State<DropdownTaskMenu> createState() => _DropdownTaskMenuState();
}

class _DropdownTaskMenuState extends State<DropdownTaskMenu> {
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
        enableSearch: true,
        enabled: true,
        width: widget.size.width * 0.8,
        onSelected: widget.controller.updateRegion,
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
