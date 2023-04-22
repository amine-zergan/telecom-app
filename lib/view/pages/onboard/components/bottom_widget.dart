import 'package:flutter/material.dart';
import 'package:telecom/view/pages/onboard/components/buble_animation.dart';
import 'package:telecom/view/pages/onboard/components/switch_widget.dart';

import '../../../theme/size_constants.dart';
import '../data_onboard.dart';

class ButtomWidget extends StatelessWidget {
  const ButtomWidget({
    super.key,
    required this.selectIndex,
  });

  final int selectIndex;

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
            SwitcheWidget(selectIndex: selectIndex)
          ],
        ),
      ),
    );
  }
}
