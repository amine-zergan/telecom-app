// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/float_back_button.dart';
import 'package:telecom/view/pages/home/start/components/nav_button.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorButton,
      body: Center(
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
              press: () {},
            ),
            CreateNavButton(
              title: "Site",
              press: () {},
            ),
            CreateNavButton(
              title: "Rapport",
              press: () {},
            ),
            CreateNavButton(
              title: "Contact",
              press: () {},
            ),
            CreateNavButton(
              title: "Navigation",
              press: () {},
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
