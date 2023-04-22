import 'package:flutter/material.dart';
import 'package:telecom/view/pages/onboard/components/image_pageview.dart';
import 'package:telecom/view/pages/onboard/components/subtitle_pageview.dart';
import 'package:telecom/view/pages/onboard/components/title_widget_pageview.dart';

import '../../../theme/size_constants.dart';
import '../data_onboard.dart';

class BodyPageView extends StatelessWidget {
  const BodyPageView({
    super.key,
    required this.onbard,
  });

  final Onboard onbard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding10),
      child: Column(
        children: [
          const Spacer(),
          TitleWidget(onbard: onbard),
          const Spacer(),
          ImageWidget(onbard: onbard),
          const Spacer(
            flex: 2,
          ),
          SubTitleWidget(onbard: onbard),
          const Spacer(),
        ],
      ),
    );
  }
}
