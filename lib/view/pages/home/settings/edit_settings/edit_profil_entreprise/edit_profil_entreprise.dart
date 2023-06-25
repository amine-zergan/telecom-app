import 'package:flutter/material.dart';
import 'package:telecom/view/components/Form_Fields/address_form_field.dart';
import 'package:telecom/view/components/Form_Fields/code_postal_form_field.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_fixe_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/config/components/image_config.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/theme/size_constants.dart';

class EditProfilEntreprise extends StatelessWidget {
  const EditProfilEntreprise({super.key});

  //! inject entreprise model from database .......... (absent)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Modifier Entreprise",
        validate: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: padding10,
          right: padding10,
          top: 1.5 * padding10,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: padding10 * 3,
            ),
            ConfigImage(
              press: () {},
              icon: Icons.maps_home_work_outlined,
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
                      hintText: "nom ...",
                      labelText: "Saisi le nom d'entreprise",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    AddressFormField(
                      onEditComplete: () {},
                      controller: TextEditingController(),
                      focusNode: FocusNode(),
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
                      focusNode: FocusNode(),
                      onSaved: (value) {},
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    PhoneFormField(
                      onEditComplete: () {},
                      controller: TextEditingController(),
                      focusNode: FocusNode(),
                      onSaved: (value) {},
                      labelText: "Saisi contact mobile Entreprise",
                    ),
                    const SizedBox(
                      height: padding10,
                    ),
                    PhoneFixFormField(
                      onEditComplete: () {},
                      controller: TextEditingController(),
                      focusNode: FocusNode(),
                      onSaved: (value) {},
                      labelText: "Saisi contact Fixe Entreprise",
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
