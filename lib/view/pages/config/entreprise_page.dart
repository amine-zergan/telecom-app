// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/view/components/Form_Fields/address_form_field.dart';
import 'package:telecom/view/components/Form_Fields/code_postal_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/config/components/image_config.dart';
import 'package:telecom/view/pages/config/components/show_image_profile_entreprise.dart';
import 'package:telecom/view/pages/config/components/sub_title_config.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/theme/size_constants.dart';

import '../../components/Form_Fields/phone_fixe_form_field.dart';

class ProfileEntreprisePage extends StatelessWidget {
  const ProfileEntreprisePage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ConfigController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: padding10, right: padding10, top: 1.5 * padding10),
      child: Column(
        children: [
          const TitleConfig(
            title: "Completer Coordonnées de L'entreprise",
            textAlign: TextAlign.center,
          ),
          const SubtitleConfig(
            title:
                "Ajouter les coordonnées de l'entreprise nom , logo et address pour utiliser lors de creation de rapports.",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: padding10 * 2,
          ),
          ConfigImage(
            press: () {
              showDialogueImagePickerProfileEntreprise(context, controller);
            },
            icon: Icons.maps_home_work_outlined,
            error: controller.errorPickerentreprise,
            file: controller.fileLogoEntreprise,
          ),
          const SizedBox(
            height: 3 * padding10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: controller.formentreprise,
              child: Column(
                children: [
                  NomFormField(
                    onEditComplete: () {
                      FocusScope.of(context)
                          .requestFocus(controller.addressEntreprise);
                    },
                    controller: controller.nameControllerEntreprise,
                    focusNode: controller.nameEntreprise,
                    onSaved: (value) {},
                    hintText: "nom ...",
                    labelText: "Saisi le nom d'entreprise",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  AddressFormField(
                    onEditComplete: () {
                      FocusScope.of(context)
                          .requestFocus(controller.codePostaleEntreprise);
                    },
                    focusNode: controller.addressEntreprise,
                    controller: controller.addressControllerEntreprise,
                    onSaved: (value) {},
                    labelText: "Saisi l'address",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  CodePostalFormField(
                    labelText: "Saisi code postale",
                    onEditComplete: () {
                      FocusScope.of(context)
                          .requestFocus(controller.numeroEntreprise);
                    },
                    controller: controller.codePostaleControllerEntreprise,
                    focusNode: controller.codePostaleEntreprise,
                    onSaved: (value) {},
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  PhoneFormField(
                    onEditComplete: () {
                      FocusScope.of(context)
                          .requestFocus(controller.numeroFixEntreprise);
                    },
                    controller: controller.phoneControllerEntreprise,
                    focusNode: controller.numeroEntreprise,
                    onSaved: (value) {},
                    labelText: "Saisi contact mobile Entreprise",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  PhoneFixFormField(
                    onEditComplete: () {
                      FocusScope.of(context).unfocus();
                    },
                    controller: controller.phoneFixControllerEntreprise,
                    focusNode: controller.numeroFixEntreprise,
                    onSaved: (value) {},
                    labelText: "Saisi contact Fixe Entreprise",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
