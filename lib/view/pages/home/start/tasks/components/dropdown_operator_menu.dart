import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';

class DropdownOperatorWithController extends StatefulWidget {
  const DropdownOperatorWithController({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final CreateTaskController controller;

  @override
  State<DropdownOperatorWithController> createState() =>
      _DropdownOperatorWithControllerState();
}

class _DropdownOperatorWithControllerState
    extends State<DropdownOperatorWithController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateTaskController>(builder: (controller) {
      return DropdownButtonHideUnderline(
        child: DropdownMenu(
          hintText: "choisir l'operator ",
          width: widget.size.width * 0.8,
          enabled: true,
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

          enableSearch: true,

          onSelected: widget.controller.updateOperator,
          dropdownMenuEntries: widget.controller.dataOperators
              .map(
                (element) => DropdownMenuEntry(
                  value: element,
                  label: element.operator,
                  enabled: true,
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
    });
  }
}
