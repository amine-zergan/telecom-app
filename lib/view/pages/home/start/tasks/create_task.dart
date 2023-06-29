// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/components/loading/loading_components.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/start/tasks/components/description_form.dart';
import 'package:telecom/view/pages/home/start/tasks/components/dropdown_operator_menu.dart';
import 'package:telecom/view/pages/home/start/tasks/components/dropdown_project_menu.dart';
import 'package:telecom/view/pages/home/start/tasks/components/dropdown_region_with_controller.dart';
import 'package:telecom/view/pages/home/start/tasks/components/dropdown_task_menu.dart';
import 'package:telecom/view/pages/home/start/components/icon_data_animatedPicker.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';
import '../components/app_bar_view.dart';

class StartTask extends GetWidget<CreateTaskController> {
  const StartTask({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBarCreate(
        title: "Ajouter une Tachée",
        validate: () {
          controller.insertTaskToDb();
        },
      ),
      body: GetBuilder<CreateTaskController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.all(
              padding10 * 1.5,
            ),
            children: [
              const Introtitle(
                title:
                    "Completer votre Mission, en ajoutant les taches realiées durant la mission.",
              ),
              const SizedBox(
                height: padding10,
              ),
              const TitleComponent(
                title: "Tache effectuée :",
              ),
              const SizedBox(
                height: padding10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SubTitleComponent(
                        title: "Date de Realisation :",
                      ),
                      const SizedBox(
                        width: padding10,
                      ),
                      GetBuilder<CreateTaskController>(
                        builder: (controller) {
                          return Text(controller.dateTask);
                        },
                      ),
                    ],
                  ),
                  IconDateWidget(
                    onTap: () {
                      controller.updateDateTask(context);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: padding10,
              ),
              const SubTitleComponent(
                title: "Type d'action :",
              ),
              const SizedBox(
                height: padding10,
              ),
              DropdownTaskMenu(controller: controller),
              const SizedBox(
                height: padding10,
              ),
              const SubTitleComponent(
                title: "Projet :",
              ),
              const SizedBox(
                height: padding10,
              ),
              GetBuilder<CreateTaskController>(
                builder: (controller) {
                  return controller.dataFromDb.isEmpty
                      ? const LoadingWidget()
                      : DropdownProjectMenu(
                          controller: controller,
                        );
                },
              ),
              const SizedBox(
                height: padding10,
              ),
              const SubTitleComponent(
                title: "Operateur :",
              ),
              const SizedBox(
                height: padding10,
              ),
              GetBuilder<CreateTaskController>(
                builder: (controller) {
                  return controller.dataOperators.isEmpty
                      ? const LoadingWidget()
                      : DropdownOperatorWithController(
                          size: size,
                          controller: controller,
                        );
                },
              ),
              GetBuilder<CreateTaskController>(
                builder: (controller) {
                  return DropDownRegionWithcontroller(
                    controller: controller,
                  );
                },
              ),
              const SizedBox(
                height: padding10,
              ),
              const SizedBox(
                height: padding10,
              ),
              DescriptionFormWithTile(
                controller: controller,
              ),
            ],
          ),
        );
      }),
    );
  }
}
