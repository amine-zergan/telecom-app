// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/pages/home/start/contact/components/body_create_contact.dart';
import 'package:telecom/view/pages/home/start/contact/controller/contact_controller.dart';

class StartContact extends StatelessWidget {
  const StartContact({super.key});
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      // respansable sur disparition de clavier
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: GetBuilder<CreateContactController>(
        builder: (controller) {
          return Scaffold(
            appBar: AppBarCreate(
              title: "Nouveau Contact",
              validate: controller.verifieAndValidate,
            ),
            body: BodyCreateContact(
              controller: controller,
            ),
          );
        },
      ),
    );
  }
}
