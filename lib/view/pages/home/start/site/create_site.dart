// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/pages/home/start/site/components/body_create_site.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';

class StartSite extends GetWidget<CreateSiteController> {
  const StartSite({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        //backgroundColor: Colors.grey.shade800,
        appBar: AppBarCreate(
          title: "Nouveau Site",
          validate: () {
            controller.insertSiteToDb();
          },
        ),
        body: GetBuilder<CreateSiteController>(
          builder: (controller) {
            return BodyCreateSite(
              controller: controller,
            );
          },
        ),
      ),
    );
  }
}
