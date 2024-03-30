import 'package:flutter/material.dart';
import 'package:telecom/view/components/Form_Fields/Longitude_form_field.dart';
import 'package:telecom/view/components/Form_Fields/description_form_field.dart';
import 'package:telecom/view/components/Form_Fields/latitude_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/site/components/listView_region_with_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/list_operator_with_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';
import 'package:telecom/view/pages/home/start/site/components/check_card_with_controller.dart';

class BodyCreateSite extends StatelessWidget {
  const BodyCreateSite({
    super.key,
    required this.controller,
  });
  final CreateSiteController controller;

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
                  """Creer, Sauvegarder les coordonnes de site, le maintenancier et leur contact.""",
            ),
            const SizedBox(
              height: padding10,
            ),
            controller.error != ""
                ? Text(
                    controller.error,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.red.shade300),
                  )
                : Container(),
            const SizedBox(
              height: padding10,
            ),
            ListOperatorWithController(
              controller: controller,
            ),
            const SizedBox(
              height: 1.5 * padding10,
            ),
            const TitleComponent(title: "Nom et Coordonnées :"),
            const SizedBox(
              height: padding10,
            ),
            NomFormField(
              controller: controller.fieldNom,
              focusNode: controller.nom,
              hintText: "Site_0001",
              labelText: "Nom Site",
              onEditComplete: () {
                FocusScope.of(context).requestFocus(controller.latitude);
                controller.selectRegioniWithNomField();
              },
            ),
            const SizedBox(
              height: padding10 / 2,
            ),
            CheckCardWithController(
              controller: controller,
            ),
            const SizedBox(
              height: padding10,
            ),
            LatitudeFormField(
              controller: controller.fieldLatitude,
              focusNode: controller.latitude,
              onEditCompleted: () {
                FocusScope.of(context).requestFocus(controller.longitude);
              },
            ),
            const SizedBox(
              height: padding10,
            ),
            LongitudeFormField(
              controller: controller.fieldLongitude,
              focusNode: controller.longitude,
              onEditCompleted: () {
                FocusScope.of(context).requestFocus(controller.maintenancier);
              },
            ),
            const SizedBox(
              height: padding10,
            ),
            const TitleComponent(
              title: "Site Info et Contact :",
            ),
            const SizedBox(
              height: padding10,
            ),
            NomFormField(
              controller: controller.fieldMaintenancier,
              focusNode: controller.maintenancier,
              hintText: "nom ...",
              labelText: "Nom de Maintenancier",
              onEditComplete: () {
                FocusScope.of(context).requestFocus(controller.contact);
              },
            ),
            const SizedBox(
              height: padding10,
            ),
            PhoneFormField(
              controller: controller.fieldContact,
              focusNode: controller.contact,
              labelText: "Contact de Maintenancier",
              onEditComplete: () {
                FocusScope.of(context).requestFocus(controller.description);
              },
            ),
            const SizedBox(
              height: padding10,
            ),
            const SubTitleComponent(
              title: "Le Gouvernant ou Region :",
            ),
            ListViewRegionWithController(
              controller: controller,
            ),
            const SizedBox(
              height: padding10,
            ),
            const SubTitleComponent(
              title: "Description :",
            ),
            const SizedBox(
              height: padding10,
            ),
            DescriptionFormField(
              controller: controller.fieldDescription,
              focusNode: controller.description,
              onEditComplete: () {
                FocusScope.of(context).unfocus();
              },
              hintText:
                  "Ajouter un autre contact de maintenancier ou un indice ...",
            ),
          ],
        ),
      ),
    );
  }
}
