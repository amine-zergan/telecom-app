import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/components/float_back_button.dart';
import 'package:telecom/view/pages/home/start/components/nav_button.dart';
import 'package:telecom/view/theme/size_constants.dart';

import '../../../../routes/route_name.dart';

class BodyCreateObject extends StatelessWidget {
  const BodyCreateObject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
