// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:telecom/view/pages/onboard/components/started_button.dart';
import 'package:telecom/view/pages/onboard/controller/onboard_controller.dart';
import 'package:telecom/view/routes/route_name.dart';

class SwitcheWidget extends StatelessWidget {
  const SwitcheWidget({
    Key? key,
    required this.selectIndex,
    required this.controller,
  }) : super(key: key);

  final int selectIndex;
  final OnBoardController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: selectIndex == 3
          ? StartedButton(
              press: () {
                Get.offNamed(RouteName.config);
                controller.initialLoad();
              },
            )
          : Container(
              key: const ValueKey("2"),
            ),
    );
  }
}
