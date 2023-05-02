// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/view/pages/onboard/components/buble_animation.dart';
import 'package:telecom/view/pages/onboard/components/switch_widget.dart';

import '../../../theme/size_constants.dart';
import '../controller/onboard_controller.dart';
import '../data_onboard.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget({
    Key? key,
    required this.selectIndex,
    required this.controller,
  }) : super(key: key);

  final int selectIndex;
  final OnBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // ignore: avoid_unnecessary_containers
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        padding: const EdgeInsets.all(padding10),
        child: Row(
          children: [
            ...List.generate(
              dataOnboard.length,
              (index) => Buble(
                selectIndex: selectIndex,
                index: index,
              ),
            ),
            const Spacer(),
            SwitcheWidget(
              selectIndex: selectIndex,
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
