import 'package:flutter/material.dart';
import 'package:telecom/view/components/Form_Fields/address_form_field.dart';
import 'package:telecom/view/components/Form_Fields/code_postal_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/config/components/image_config.dart';
import 'package:telecom/view/pages/config/components/sub_title_config.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ProfileEntreprisePage extends StatelessWidget {
  const ProfileEntreprisePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: padding10, right: padding10, top: 1.5 * padding10),
      child: Column(
        children: [
          const TitleConfig(title: "Completer Coordonnées de L'entreprise"),
          const SubtitleConfig(
            title:
                "Ajouter les coordonnées de l'entreprise nom , logo et address pour utiliser lors de creation de rapports.",
          ),
          const SizedBox(
            height: padding10 * 2,
          ),
          ConfigImage(
            press: () {},
            icon: Icons.maps_home_work_outlined,
            error: "",
            file: null,
          ),
          const SizedBox(
            height: 3 * padding10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: [
                  NomFormField(
                    onEditComplete: () {},
                    controller: TextEditingController(),
                    onSaved: (value) {},
                    hintText: "nom ...",
                    labelText: "Saisi le nom d'entreprise",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  AddressFormField(
                    onEditComplete: () {},
                    controller: TextEditingController(),
                    onSaved: (value) {},
                    labelText: "Saisi l'address",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  CodePostalFormField(
                    labelText: "Saisi code postale",
                    onEditComplete: () {},
                    controller: TextEditingController(),
                    onSaved: (value) {},
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  PhoneFormField(
                    onEditComplete: () {},
                    controller: TextEditingController(),
                    onSaved: (value) {},
                    labelText: "Saisi contact Entreprise",
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
