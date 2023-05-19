// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class DropDownRegionWithcontroller extends StatefulWidget {
  const DropDownRegionWithcontroller({
    Key? key,
    required this.size,
    required this.controller,
    this.textEditController,
  }) : super(key: key);
  final Size size;
  final CreateTaskController controller;
  final TextEditingController? textEditController;

  @override
  State<DropDownRegionWithcontroller> createState() =>
      _DropDownRegionWithcontrollerState();
}

class _DropDownRegionWithcontrollerState
    extends State<DropDownRegionWithcontroller> {
  @override
  Widget build(BuildContext context) {
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
            width: widget.size.width * 0.8,
            menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(
                Colors.grey.shade800,
              ),
            ),
            controller: widget.textEditController,
            leadingIcon: const Icon(
              Icons.place,
            ),
            enableFilter: true,
            enableSearch: true,
            enabled: true,
            onSelected: widget.controller.updateRegion,
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
        widget.controller.errorRegion == ""
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: padding10,
                  ),
                  Text(
                    widget.controller.errorRegion,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
      ],
    );
  }
}
