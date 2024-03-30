import 'package:flutter/material.dart';
import 'package:telecom/view/pages/config/components/page_config_view.dart';

import '../controller/config_controller.dart';

class BodyConfigView extends StatelessWidget {
  const BodyConfigView({
    super.key,
    required this.controller,
  });
  final ConfigController controller;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: SingleChildScrollView(
        child: PageViewConfig(
          controller: controller,
        ),
      ),
    );
  }
}
