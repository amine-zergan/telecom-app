// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/components/float_back_button.dart';
import 'package:telecom/view/pages/home/start/components/nav_button.dart';
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class CreateObjectPage extends StatelessWidget {
  const CreateObjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorButton,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 6,
            ),
            const BackFloatButton(),
            const SizedBox(
              height: padding10 * 2,
            ),
            CreateNavButton(
              title: "Mission",
              press: () {
                Get.toNamed(RouteName.startMission);
              },
            ),
            CreateNavButton(
              title: "Site",
              press: () {
                Get.toNamed(RouteName.startSite);
              },
            ),
            CreateNavButton(
              title: "Rapport",
              press: () {
                Get.toNamed(RouteName.startReport);
              },
            ),
            CreateNavButton(
              title: "Contact",
              press: () {
                Get.toNamed(RouteName.startContact);
              },
            ),
            CreateNavButton(
              title: "Taches",
              press: () {
                Get.toNamed(RouteName.startTask);
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
