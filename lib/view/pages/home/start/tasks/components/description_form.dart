import 'package:flutter/material.dart';
import 'package:telecom/validators/task/task_validator.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class DescriptionFormWithTile extends StatelessWidget {
  const DescriptionFormWithTile({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateTaskController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubTitleComponent(
          title: "Details et description de Tâche :",
        ),
        const SizedBox(
          height: padding10,
        ),
        Form(
          key: controller.formKey,
          child: TextFormField(
            controller: controller.description,
            validator: TaskValidator.descriptionTaskValidate,
            autocorrect: false,
            maxLines: 4,
            decoration: const InputDecoration(
              hintText:
                  "description detaillees de Tache et ajouter code sites ...",
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
