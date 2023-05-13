// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/utils/converter/week_day_integer_convertor.dart';

import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/start/tasks/create_task.dart';
import 'package:telecom/view/theme/size_constants.dart';

import '../components/app_bar_view.dart';

// ignore: must_be_immutable
class StartMission extends GetWidget<CreateMissionController> {
  const StartMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Creation Mission",
        validate: () async {},
      ),
      body: SafeArea(
        bottom: false,
        child: GetBuilder<CreateMissionController>(builder: (controller) {
          return ListView(
            padding: const EdgeInsets.all(
              1.5 * padding10,
            ),
            children: [
              const Introtitle(
                title:
                    "Commencer à ouvrir votre mission et la suivie jusqu'à la cloturée et organiser votre taches et dépenses",
              ),
              const SizedBox(
                height: 2 * padding10,
              ),
              const TitleComponent(
                title: "Mission et Dépense :",
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
                        title: "Date de depart :",
                      ),
                      const SizedBox(
                        width: padding10,
                      ),
                      GetBuilder<CreateMissionController>(
                        builder: (controller) {
                          return Text(
                            controller.dateDepart,
                          );
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
              const NombreJourEstime(),
              const SizedBox(
                height: padding10 / 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SubTitleComponent(
                    title: "Mission en equipe ?",
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: controller.updatetoggleEquipeTrueValue,
                        child: const Text("oui"),
                      ),
                      TextButton(
                        onPressed: controller.updatetoggleEquipeFalseValue,
                        child: const Text(
                          "Non",
                        ),
                      )
                    ],
                  )
                ],
              ),
              GetBuilder<CreateMissionController>(builder: (controller) {
                return controller.isEquipe
                    ? AddColleguework(
                        controller: controller,
                      )
                    : Container();
              }),
              ...List.generate(controller.membreEquipe.length, (index) {
                String nom = controller.membreEquipe[index];
                return controller.isEquipe
                    ? GetBuilder<CreateMissionController>(
                        builder: (controller) {
                        return Card(
                          elevation: 0,
                          color: Colors.transparent,
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: padding10 / 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                5,
                              ),
                              side: const BorderSide(
                                color: Colors.black54,
                              ),
                            ),
                            title: Text(
                              nom,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(),
                            ),
                            trailing: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoAlertDialog(
                                        content: Text(
                                          "voulez vous enlever $nom depuis cette mission",
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Get.back();
                                            },
                                            child: const Text("Retour"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              controller
                                                  .updateNombreEquipeRemove(
                                                      index);
                                              Get.back();
                                            },
                                            child: const Text("Confirm"),
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.remove_circle_outline,
                                  size: 20,
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                    : Container();
              }),
              DeplacementTileCheckYesNo(
                controller: controller,
              ),
              GetBuilder<CreateMissionController>(builder: (controller) {
                return controller.isDeplacement
                    ? Column(
                        children: [
                          AddandRemouveComponent(
                            title: "jour en deplacement:",
                            bonCarburant: controller.jourdeplacement,
                            increase: controller.updateIncrementJourDeplacement,
                            decrease: controller.updateDecrementJourDeplacement,
                          ),
                          const SizedBox(
                            height: padding10,
                          ),
                          NomFormField(
                            labelText: "montant de deplacement",
                            hintText: "tarif total de deplacement en dinar",
                            controller: controller.fieldsFraisDeplacement,
                          ),
                        ],
                      )
                    : Container();
              }),
              AddSiteComponent(
                controller: controller,
              ),
              GetBuilder<CreateMissionController>(
                builder: (controller) {
                  return CodeSiteComponent(
                    controller: controller,
                  );
                },
              ),
              const SizedBox(
                height: padding10 / 2,
              ),
              const TitleComponent(
                title: "Transport :",
              ),
              const SizedBox(
                height: padding10,
              ),
              const SubTitleComponent(
                title: "Vehicule et carburant :",
              ),
              const SizedBox(
                height: 1.5 * padding10,
              ),
              NomFormField(
                labelText: "Nom de Vehicule",
                hintText: "Tata 240-Tunis-98xx",
                controller: controller.fieldsVehicule,
              ),
              const SizedBox(
                height: padding10,
              ),
              NomFormField(
                controller: controller.fieldsIndexDepart,
                labelText: "Index de depart",
                hintText: "index en km",
              ),
              const SizedBox(
                height: padding10 / 2,
              ),
              GetBuilder<CreateMissionController>(
                builder: (controller) {
                  return AddandRemouveComponent(
                    title: "Bon de carburants :",
                    bonCarburant: controller.carburanat,
                    increase: controller.updateIncrementCarburant,
                    decrease: controller.updateDecrementCarburant,
                  );
                },
              ),
              const SizedBox(
                height: padding10,
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CodeSiteComponent extends StatelessWidget {
  const CodeSiteComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateMissionController controller;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15.0,
      direction: Axis.horizontal,
      children: List<Widget>.generate(
        controller.codeSite.length,
        (int index) {
          final site = controller.codeSite[index];
          return Chip(
            label: Text(
              site,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onDeleted: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Text(
                      "voulez vous enlever $site depuis cette mission",
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Retour"),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.updateNombreSiteRemove(index);
                          Get.back();
                        },
                        child: const Text("Confirm"),
                      ),
                    ],
                  );
                },
              );
            },
            autofocus: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
          );
        },
      ).toList(),
    );
  }
}

class AddSiteComponent extends StatelessWidget {
  const AddSiteComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateMissionController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleComponent(
          title: "Codes sites :",
        ),
        TextButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                barrierColor: Colors.black26,
                builder: (context) {
                  return CupertinoAlertDialog(
                    content: Column(
                      children: [
                        const Text(
                          "Ajouter les code sites ",
                        ),
                        const SizedBox(
                          height: padding10,
                        ),
                        CupertinoTextField(
                          controller: controller.fieldsNomCodeSite,
                          autocorrect: false,
                          cursorColor: Colors.white,
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.black38,
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "Retour",
                        ),
                      ),
                      TextButton(
                        onPressed: controller.updateNombreSiteAdd,
                        child: const Text(
                          "Ajouter",
                        ),
                      ),
                    ],
                  );
                });
          },
          icon: const Icon(Icons.add),
          label: const Text("Ajouter"),
        )
      ],
    );
  }
}

class AddColleguework extends StatelessWidget {
  const AddColleguework({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateMissionController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: () {
          showDialog(
              context: context,
              barrierColor: Colors.black26,
              builder: (context) {
                return CupertinoAlertDialog(
                  content: Column(
                    children: [
                      const Text(
                        "Vos collegues en mission",
                      ),
                      const SizedBox(
                        height: padding10,
                      ),
                      CupertinoTextField(
                        controller: controller.fieldsEquipe,
                        autocorrect: false,
                        cursorColor: Colors.white,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Retour",
                      ),
                    ),
                    TextButton(
                      onPressed: controller.updateNombreEquipeAdd,
                      child: const Text(
                        "Ajouter",
                      ),
                    ),
                  ],
                );
              });
        },
        icon: const Icon(
          Icons.add_home_sharp,
        ),
        label: const Text(
          "Ajouter equipe",
        ),
      ),
    );
  }
}

class DeplacementTileCheckYesNo extends StatelessWidget {
  const DeplacementTileCheckYesNo({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateMissionController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleComponent(
          title: "Mission en deplacement ?",
        ),
        Row(
          children: [
            TextButton(
              onPressed: controller.updatetoggleDeplacementTrueValue,
              child: const Text(
                "oui",
              ),
            ),
            TextButton(
              onPressed: controller.updatetoggleDeplacementFalseValue,
              child: const Text(
                "Non",
              ),
            )
          ],
        )
      ],
    );
  }
}

class NombreJourEstime extends StatelessWidget {
  const NombreJourEstime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SubTitleComponent(
          title: "Nombre de jour estimé :",
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black26,
            ),
          ),
          child: GetBuilder<CreateMissionController>(
            builder: (controller) {
              return DropdownButtonHideUnderline(
                child: Padding(
                  padding: const EdgeInsets.all(padding10 / 2),
                  child: DropdownButton<int>(
                    borderRadius: BorderRadius.circular(10),
                    alignment: Alignment.topCenter,
                    value: controller.nombreJour,
                    isDense: true,
                    dropdownColor: Colors.grey.shade900,
                    itemHeight: 50,
                    elevation: 0,
                    onChanged: controller.onChangeJour,
                    items: controller.jourMission
                        .map(
                          (jour) => DropdownMenuItem(
                            value: JourConvertor.convertJourMission(jour),
                            child: Text(
                              jour,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class AddandRemouveComponent extends StatelessWidget {
  const AddandRemouveComponent({
    Key? key,
    required this.title,
    this.increase,
    this.decrease,
    required this.bonCarburant,
  }) : super(key: key);
  final String title;
  final int bonCarburant;
  final VoidCallback? increase;
  final VoidCallback? decrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubTitleComponent(
          title: title,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: decrease,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.grey.shade800,
                ),
              ),
              child: const Icon(
                Icons.remove_outlined,
                size: 20,
              ),
            ),
            const SizedBox(
              width: padding10 / 2,
            ),
            Text(
              bonCarburant.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              width: padding10 / 2,
            ),
            TextButton(
              onPressed: increase,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.grey.shade800,
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
