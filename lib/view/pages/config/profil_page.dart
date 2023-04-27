// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:telecom/view/pages/config/components/Form_Fields/address_form_field.dart';
import 'package:telecom/view/pages/config/components/Form_Fields/code_postal_form_field.dart';
import 'package:telecom/view/pages/config/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/pages/config/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/config/components/sub_title_config.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TitleConfig(title: "Completer votre Profile"),
          const SubtitleConfig(
            title:
                "Encore une seule etape pour configurer votre compte. Ajouter votre prenom, numero de telephone , image et votre address.",
          ),
          const SizedBox(
            height: 2 * padding10,
          ),
          Stack(
            fit: StackFit.loose,
            alignment: Alignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/pylone.png"),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Icon(
                  Icons.image_search,
                  size: 30,
                  color: Colors.grey.shade700,
                ),
              )
            ],
          ),
          const SizedBox(
            height: padding10,
          ),
          const Text(
            //"error return by validator",
            "",
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
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
                    hintText: "nom et prenom",
                    labelText: "Saisi votre nom",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  AddressFormField(
                    onEditComplete: () {},
                    controller: TextEditingController(),
                    onSaved: (value) {},
                    labelText: "Saisi votre address",
                  ),
                  const SizedBox(
                    height: padding10,
                  ),
                  CodePostalFormField(
                    labelText: "Saisi votre code postale",
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
