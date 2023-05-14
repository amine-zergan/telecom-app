import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/mission/components/add_equipe_card.dart';
import 'package:telecom/view/pages/home/start/mission/components/add_remouve_component.dart';
import 'package:telecom/view/pages/home/start/mission/components/add_site_card.dart';
import 'package:telecom/view/pages/home/start/mission/components/code_site_widget.dart';
import 'package:telecom/view/pages/home/start/mission/components/deplacement_listtile_widget.dart';
import 'package:telecom/view/pages/home/start/mission/components/nombre_jour_estime_widget.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/start/tasks/create_task.dart';
import 'package:telecom/view/theme/size_constants.dart';

class BodyCreateMission extends StatelessWidget {
  const BodyCreateMission({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: GetBuilder<CreateMissionController>(builder: (controller) {
        return Form(
          key: controller.transportKey,
          child: ListView(
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
                height: padding10,
              ),
              const SubTitleComponent(
                title: "Chef de Projet :",
              ),
              const SizedBox(
                height: 1.5 * padding10,
              ),
              NomFormField(
                labelText: "Nom Prenom",
                controller: controller.fieldsChefProjet,
                hintText: "chef de projet de mission",
              ),
              const SizedBox(
                height: padding10,
              ),
              const SubTitleComponent(
                title: "Chef d'equipe ou supervisseur :",
              ),
              const SizedBox(
                height: 1.5 * padding10,
              ),
              NomFormField(
                labelText: "Nom Prenom",
                controller: controller.fieldsSupervisseur,
                hintText: "chef d'equipe de mission ou supervisseur",
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
                          Form(
                            key: controller.deplacementKey,
                            child: NomFormField(
                              labelText: "montant de deplacement",
                              hintText: "tarif total de deplacement en dinar",
                              controller: controller.fieldsFraisDeplacement,
                            ),
                          ),
                        ],
                      )
                    : Container();
              }),
              AddSiteComponent(
                controller: controller,
              ),
              CodeSiteComponent(
                controller: controller,
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
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(
                height: padding10 / 2,
              ),
              GetBuilder<CreateMissionController>(
                builder: (controller) {
                  return AddandRemouveComponent(
                    title: "Bon de carburants :",
                    bonCarburant: controller.carburant,
                    increase: controller.updateIncrementCarburant,
                    decrease: controller.updateDecrementCarburant,
                  );
                },
              ),
              const SizedBox(
                height: padding10,
              ),
            ],
          ),
        );
      }),
    );
  }
}

// ignore: must_be_immutable
