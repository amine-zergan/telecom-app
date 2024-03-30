import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/views/settings/controller/setting_controller.dart';
import 'package:telecom/view/pages/home/views/settings/setting_page.dart';

class SocieteCard extends StatelessWidget {
  const SocieteCard({
    super.key,
    required this.controller,
    required this.onPressed,
  });
  final SettingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return CardSetting(
      title: "Societé",
      subtitle: controller.entreprise == null
          ? "Nom de entreprise "
          : controller.entreprise!.name,
      logo: controller.imageEntreprise == null
          ? const Padding(
              padding: EdgeInsets.only(left: 17.0),
              child: Icon(
                Icons.home_work,
                size: 25,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(
                30,
              ),
              child: Image.memory(
                controller.imageEntreprise!,
                width: 50,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
      onPressed: onPressed,
    );
  }
}
