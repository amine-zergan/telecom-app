import 'package:flutter/material.dart';
import 'package:telecom/view/components/Form_Fields/address_form_field.dart';
import 'package:telecom/view/components/Form_Fields/code_postal_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/config/components/image_config.dart';

import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/theme/size_constants.dart';

class EditProfilUser extends StatelessWidget {
  const EditProfilUser({super.key});

  //! inject profil from database .......... (absent)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Mettre A jour votre Profile",
        validate: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: ListView(
          children: [
            const SizedBox(
              height: 5 * padding10,
            ),
            ConfigImage(
              press: () {
                ///showDialogueImagePickerProfile(context, controller);
              },
              icon: Icons.person_add_alt_outlined,
              error: "",
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
                      focusNode: FocusNode(),
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
                      focusNode: FocusNode(),
                      onSaved: (value) {},
                      onChanged: (value) {},
                      labelText: "Saisi votre address",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    CodePostalFormField(
                      labelText: "Saisi votre code postale",
                      onEditComplete: () {},
                      controller: TextEditingController(),
                      focusNode: FocusNode(),
                      onSaved: (value) {},
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    PhoneFormField(
                      onEditComplete: () {
                        FocusScope.of(context).unfocus();
                      },
                      controller: TextEditingController(),
                      focusNode: FocusNode(),
                      onSaved: (value) {},
                      onChanged: (value) {},
                      labelText: "Saisi votre numero",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
