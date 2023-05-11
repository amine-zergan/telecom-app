import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownOperatorWithController extends StatelessWidget {
  const DropdownOperatorWithController({
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
        hintText: "choisir l'operator ",
        width: size.width * 0.8,
        menuStyle: MenuStyle(
          backgroundColor: MaterialStatePropertyAll(
            Colors.grey.shade800,
          ),
          elevation: const MaterialStatePropertyAll(10),
        ),
        //controller: taskfields,
        leadingIcon: const Icon(
          Icons.network_check_outlined,
        ),
        enableFilter: true,
        onSelected: controller.updateOperator,
        dropdownMenuEntries: controller.dataOperators
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
