import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/config/contract_page.dart';
import 'package:telecom/view/pages/config/entreprise_page.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/pages/config/post_page.dart';
import 'package:telecom/view/pages/config/profil_page.dart';
import 'package:telecom/view/pages/config/salaire_de_entreprise.dart';
import 'package:telecom/view/pages/config/taille_entreprise.dart';

import '../controller/config_controller.dart';

class PageViewConfig extends StatelessWidget {
  const PageViewConfig({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ConfigController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: Get.height,
      child: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        onPageChanged: controller.updateCurrentPage,
        // replaced with setState: in stful widget ..
        children: [
          NiveauPage(
            controller: controller,
          ),
          PostPage(
            controller: controller,
          ),
          ContractPage(
            controller: controller,
          ),
          SalairePage(
            controller: controller,
          ),
          TaillePage(
            controller: controller,
          ),
          ProfilePage(
            controller: controller,
          ),
          ProfileEntreprisePage(
            controller: controller,
          ),
        ],
      ),
    );
  }
}
