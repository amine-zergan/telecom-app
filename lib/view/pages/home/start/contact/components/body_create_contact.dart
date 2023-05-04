import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/contact/components/post_radio_card.dart';

import '../../../../../components/Form_Fields/nom_form_field.dart';
import '../../../../../components/Form_Fields/phone_form_field.dart';
import '../../../../../theme/size_constants.dart';
import '../../site/components/title_section_component.dart';
import '../controller/contact_controller.dart';

class BodyCreateContact extends StatelessWidget {
  const BodyCreateContact({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Form(
        key: controller.formKey,
        child: ListView(
          padding: const EdgeInsets.all(padding10 * 1.5),
          children: [
            const Introtitle(
              title:
                  "Commencer á creer votre propre repertoire de travail et organiser votre contacts",
            ),
            const SizedBox(
              height: 2 * padding10,
            ),
            const TitleComponent(title: "Contact et Info :"),
            const SizedBox(
              height: padding10,
            ),
            NomFormField(
              controller: controller.nom,
              focusNode: controller.focusNom,
              onEditComplete: () {
                FocusScope.of(context).requestFocus(controller.focusContact);
              },
              labelText: "Nom contact",
              hintText: "Saisi nom contact",
            ),
            const SizedBox(
              height: padding10,
            ),
            PhoneFormField(
              controller: controller.contact,
              focusNode: controller.focusContact,
              onEditComplete: () {
                FocusScope.of(context).unfocus();
              },
              labelText: "numero telephone",
            ),
            const SizedBox(
              height: padding10,
            ),
            const TitleComponent(
              title: "Poste Occupée :",
            ),
            const SizedBox(
              height: padding10,
            ),
            ...List.generate(controller.posts.length, (index) {
              String model = controller.posts[index];
              return PostRadioTileCard(
                controller: controller,
                model: model,
                index: index,
              );
            }),
          ],
        ),
      ),
    );
  }
}
