import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownProjectMenu extends StatelessWidget {
  const DropdownProjectMenu({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final CreateTaskController controller;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownMenu(
        hintText: "choisir le projet ",
        width: size.width * 0.8,
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.grey.shade800,
          ),
        ),
        //controller: taskfields,
        leadingIcon: const Icon(
          Icons.add_home_work,
        ),
        enableFilter: true,
        onSelected: controller.updateProject,
        dropdownMenuEntries: controller.dataFromDb
            .map(
              (element) => DropdownMenuEntry(
                value: element,
                label: element.name,
                leadingIcon: Image.asset(
                  element.image,
                  width: 20,
                  height: 20,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
