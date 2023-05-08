// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telecom/utils/converter/enum/indoor_outdoor_enum.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/pages/home/start/equipements/controller/create_equipement_controller.dart';
import 'package:telecom/view/pages/home/start/site/create_site.dart';
import 'package:telecom/view/pages/home/start/tasks/data/data_project.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';
import '../../../../../model/components/project/project_model.dart';
import '../../../../../validators/equipement/equipement_validator.dart';
import '../components/intro_title_page.dart';
import '../site/components/title_section_component.dart';

class StartMaterial extends GetWidget<CreateEquipementController> {
  const StartMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: AppBarCreate(
          title: "Nouveau Equipement",
          validate: () async {
            controller.insertEquipementToDatabase();
          },
        ),
        body: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: padding10 * 1.5,
            ),
            children: [
              const IntroductionTitle(),
              const SizedBox(
                height: padding10,
              ),
              GetBuilder<CreateEquipementController>(builder: (controller) {
                return controller.error == ""
                    ? Container()
                    : Text(
                        controller.error,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.red.shade300),
                        textAlign: TextAlign.center,
                      );
              }),
              const NomAndDescriptionTitle(),
              GetBuilder<CreateEquipementController>(
                builder: (controller) {
                  return Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NomFormField(
                          controller: controller.fieldsNom,
                          focusNode: controller.nom,
                          maxLine: 1,
                          labelText: "Nom Equipement",
                          hintText: "Antenne FH ....",
                          onEditComplete: () {
                            FocusScope.of(context)
                                .requestFocus(controller.reference);
                          },
                        ),
                        const SizedBox(
                          height: padding10,
                        ),
                        NomFormField(
                          controller: controller.fieldsReference,
                          focusNode: controller.reference,
                          maxLine: 1,
                          keyboardType: TextInputType.text,
                          labelText: "Reference ",
                          hintText: "00000340",
                          validator: ValidatorEquipement.validatorReference,
                          onEditComplete: () {
                            FocusScope.of(context)
                                .requestFocus(controller.description);
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(8),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        const SizedBox(
                          height: padding10,
                        ),
                        NomFormField(
                          controller: controller.fieldsDescription,
                          focusNode: controller.description,
                          labelText: "Description ",
                          hintText: "23GHZ-120CM, MONOPOLAR INTÉGRÉE NEC...",
                          onEditComplete: () {
                            FocusScope.of(context).unfocus();
                          },
                          onSaved: (value) {
                            // ignore: avoid_print
                            print(value!.toUpperCase());
                          },
                        ),
                        const SizedBox(
                          height: 2 * padding10,
                        ),
                        RadioTileInstallationEquipement(
                          controller: controller,
                        ),
                        const TitleComponent(
                          title: "Fournisseur :",
                        ),
                        const SizedBox(
                          height: padding10,
                        ),
                        ListViewFournisseur(
                          controller: controller,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NomAndDescriptionTitle extends StatelessWidget {
  const NomAndDescriptionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(
          height: padding10,
        ),
        TitleComponent(
          title: "Nom et description :",
        ),
        SizedBox(
          height: 2 * padding10,
        ),
      ],
    );
  }
}

class IntroductionTitle extends StatelessWidget {
  const IntroductionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 1.5 * padding10,
      ),
      child: Introtitle(
        title:
            "Commencer a ajouter les equipements pour generer les Rapports de livraison et de retour materials.",
      ),
    );
  }
}

class ListViewFournisseur extends StatelessWidget {
  const ListViewFournisseur({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateEquipementController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: Get.height * 0.09,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dataProjects.length,
        itemBuilder: ((context, index) {
          Project project = dataProjects[index];
          return CardFournisseur(
            project: project,
            index: index,
            selectedProject: controller.selectedProject,
            onTap: controller.onChangedValue,
          );
        }),
      ),
    );
  }
}

class CardFournisseur extends StatelessWidget {
  const CardFournisseur({
    Key? key,
    required this.project,
    required this.selectedProject,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final Project project;
  final int? selectedProject;
  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: selectedProject == index
            ? Colors.grey.shade300
            : Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      width: 100,
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                project.image,
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: selectedProject == index
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RadioTileInstallationEquipement extends StatelessWidget {
  const RadioTileInstallationEquipement({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final CreateEquipementController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SubTitleComponent(
          title: "Installation d'equipement :",
        ),
        const SizedBox(
          height: padding10,
        ),
        CardRadioTile(
          value: Qualification.indoor,
          title: "Indoor",
          controller: controller,
        ),
        CardRadioTile(
          value: Qualification.outdoor,
          title: "Outdoor",
          controller: controller,
        ),
        const SizedBox(
          height: padding10,
        ),
      ],
    );
  }
}

class CardRadioTile extends StatelessWidget {
  const CardRadioTile({
    Key? key,
    required this.value,
    required this.title,
    required this.controller,
  }) : super(key: key);
  final Qualification value;
  final String title;
  final CreateEquipementController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.black12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: RadioListTile(
        title: Text(title),
        activeColor: colorButton,
        contentPadding: EdgeInsets.zero,
        value: value,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        groupValue: controller.groupValuePosition,
        onChanged: controller.onChanged,
      ),
    );
  }
}
