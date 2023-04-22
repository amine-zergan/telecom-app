import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/onboard/components/started_button.dart';
import 'package:telecom/view/routes/route_name.dart';

class SwitcheWidget extends StatelessWidget {
  const SwitcheWidget({
    super.key,
    required this.selectIndex,
  });

  final int selectIndex;

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
                // ignore: avoid_print
                print("======= navigation to config-page =========");
              },
            )
          : Container(
              key: const ValueKey("2"),
            ),
    );
  }
}
