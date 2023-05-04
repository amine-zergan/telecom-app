import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/components/Form_Fields/nom_form_field.dart';
import 'package:telecom/view/components/Form_Fields/phone_form_field.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';
import 'package:telecom/view/pages/home/start/contact/controller/contact_controller.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class StartContact extends StatefulWidget {
  const StartContact({super.key});

  @override
  State<StartContact> createState() => _StartContactState();
}

class _StartContactState extends State<StartContact> {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: GetBuilder<ContactController>(builder: (controller) {
        return Scaffold(
          appBar: AppBarCreate(
            title: "Nouveau Contact",
            validate: controller.verifieAndValidate,
          ),
          body: SafeArea(
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
                      FocusScope.of(context)
                          .requestFocus(controller.focusContact);
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
                    return Card(
                      elevation: 0,
                      color: controller.selectValue == index
                          ? Colors.grey.shade800
                          : Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          padding10 / 2,
                        ),
                      ),
                      child: RadioListTile(
                        activeColor: colorButton,
                        contentPadding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            padding10 / 2,
                          ),
                        ),
                        value: model,
                        groupValue: controller.post,
                        title: Text(model),
                        onChanged: (value) {
                          controller.onChanged(value, index);
                        },
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
