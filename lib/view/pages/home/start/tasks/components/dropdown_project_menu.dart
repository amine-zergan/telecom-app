import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownProjectMenu extends StatelessWidget {
  const DropdownProjectMenu({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CreateTaskController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DropdownButtonHideUnderline(
      child: DropdownMenu(
        hintText: "choisir le projet ",
        width: size.width * 0.8,
        menuStyle: const MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.white,
          ),
        ),
        //controller: taskfields,
        leadingIcon: const Icon(
          Icons.add_home_work,
        ),

        enableSearch: true,
        enabled: true,
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
