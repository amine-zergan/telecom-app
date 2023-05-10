import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/data/task_data.dart';

import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

import '../components/app_bar_view.dart';

class StartTask extends StatefulWidget {
  const StartTask({super.key});

  @override
  State<StartTask> createState() => _StartTaskState();
}

class _StartTaskState extends State<StartTask> {
  late TextEditingController description;

  @override
  void initState() {
    description = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    description.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCreate(
        title: "Ajouter une Tachée",
        validate: () {},
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(padding10 * 1.5),
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
                const SubTitleComponent(
                  title: "Date de Realisation :",
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LottieBuilder.asset(
                    "assets/animations/calender.json",
                    width: 30,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: padding10,
            ),
            DropdownButtonHideUnderline(
              child: DropdownMenu(
                hintText: "type de tache :",
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.shade800,
                  ),
                ),
                //controller: taskfields,
                leadingIcon: const Icon(
                  Icons.work_outline,
                ),
                enableFilter: true,
                width: size.width * 0.8,
                onSelected: (value) {},
                dropdownMenuEntries: tasksData
                    .map(
                      (element) => DropdownMenuEntry(
                        value: element,
                        label: element,
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: padding10,
            ),
            const SubTitleComponent(
              title: "Projet :",
            ),
            const SizedBox(
              height: padding10,
            ),
            GetBuilder<CreateTaskController>(builder: (controller) {
              return controller.dataFromDb.isEmpty
                  ? Container()
                  : DropdownButtonHideUnderline(
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
                        onSelected: (value) {},
                        dropdownMenuEntries: controller.dataFromDb
                            .map(
                              (element) => DropdownMenuEntry(
                                value: element,
                                label: element.name,
                              ),
                            )
                            .toList(),
                      ),
                    );
            }),
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
                width: size.width * 0.8,
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Colors.grey.shade800,
                  ),
                ),
                //controller: taskfields,
                leadingIcon: const Icon(
                  Icons.home_work_outlined,
                ),
                enableFilter: true,
                onSelected: (value) {},
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
            const SizedBox(
              height: padding10,
            ),
            const SubTitleComponent(
              title: "Details et description de Tâche :",
            ),
            const SizedBox(
              height: padding10,
            ),
            TextFormField(
              controller: description,
              autocorrect: false,
              maxLines: 4,
              decoration: const InputDecoration(
                  hintText:
                      "description detaillees de Tache et ajouter code sites ...",
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
