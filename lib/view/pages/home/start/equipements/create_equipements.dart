// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/pages/home/start/equipements/components/introduction_title.dart';
import 'package:telecom/view/pages/home/start/equipements/components/listView_project.dart';
import 'package:telecom/view/pages/home/start/equipements/components/nom_description_title.dart';
import 'package:telecom/view/pages/home/start/equipements/components/radio_tile_install_equipement.dart';
import 'package:telecom/view/pages/home/start/equipements/controller/create_equipement_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';
import '../../../../../validators/equipement/equipement_validator.dart';
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
              GetBuilder<CreateEquipementController>(
                builder: (controller) {
                  return controller.error == ""
                      ? Container()
                      : Text(
                          controller.error,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.red.shade300,
                                  ),
                          textAlign: TextAlign.center,
                        );
                },
              ),
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
