// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/components/Form_Fields/address_form_field.dart';
import 'package:telecom/view/components/Form_Fields/code_postal_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/config/components/image_config.dart';
import 'package:telecom/view/pages/config/components/sub_title_config.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Column(
          children: [
            const TitleConfig(title: "Completer votre Profile"),
            const SubtitleConfig(
              title:
                  "Encore une seule etape pour configurer votre compte. Ajouter votre prenom, numero de telephone , image et votre address.",
            ),
            const SizedBox(
              height: padding10,
            ),
            ConfigImage(
              press: () {},
              icon: Icons.person_add_alt_outlined,
              error: "",
              file: null,
            ),
            const SizedBox(
              height: 3 * padding10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formProfile,
                child: Column(
                  children: [
                    NomFormField(
                      onEditComplete: () {},
                      focusNode: controller.name,
                      controller: controller.nameControllerProfile,
                      onSaved: (value) {},
                      hintText: "nom et prenom",
                      labelText: "Saisi votre nom",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    AddressFormField(
                      onEditComplete: () {},
                      controller: controller.addressControllerProfile,
                      focusNode: controller.address,
                      onSaved: (value) {},
                      labelText: "Saisi votre address",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    CodePostalFormField(
                      labelText: "Saisi votre code postale",
                      focusNode: controller.codePostale,
                      onEditComplete: () {},
                      controller: controller.codePostaleControllerProfile,
                      onSaved: (value) {},
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    PhoneFormField(
                      onEditComplete: () {},
                      controller: controller.phoneControllerProfile,
                      focusNode: controller.numero,
                      onSaved: (value) {},
                      labelText: "Saisi votre numero",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
