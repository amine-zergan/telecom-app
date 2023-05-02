import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/onboard/controller/onboard_controller.dart';

import '../components/body_page_view.dart';
import '../components/bottom_widget.dart';
import '../data_onboard.dart';

class BodyOnboard extends StatelessWidget {
  const BodyOnboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: GetBuilder<OnBoardController>(
              builder: (controller) {
                return PageView.builder(
                  itemCount: dataOnboard.length,
                  onPageChanged: controller.onChangePage,
                  itemBuilder: (context, index) {
                    final onbard = dataOnboard[index];
                    return BodyPageView(onbard: onbard);
                  },
                );
              },
            ),
          ),
          GetBuilder<OnBoardController>(
            builder: (controller) {
              return ButtomWidget(
                selectIndex: controller.selectedIndex,
                controller: controller,
              );
            },
          )
        ],
      ),
    );
  }
}
