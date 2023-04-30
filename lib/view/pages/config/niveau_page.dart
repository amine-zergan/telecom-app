// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/theme/color_constants.dart';

class NiveauPage extends StatelessWidget {
  const NiveauPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
          title: "Quel est votre Niveau Scolaire ?",
        ),
        ...List.generate(etude.length, (index) {
          String niveau = etude[index];
          return GetBuilder<ConfigController>(builder: (controller) {
            return CardChoix(
              index: index,
              selectedIndex: controller.selectNiveau,
              onTap: () {
                controller.updateNiveau(index, niveau);
              },
              title: niveau,
            );
          });
        }),
        const SizedBox(
          height: 150,
        ),
      ],
    );
  }
}

class TitleConfig extends StatelessWidget {
  const TitleConfig({
    Key? key,
    required this.title,
    this.textAlign,
  }) : super(key: key);
  final String title;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        title,
        textAlign: textAlign,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

class CardChoix extends StatelessWidget {
  const CardChoix({
    Key? key,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
    required this.title,
  }) : super(key: key);
  final int index;
  final int? selectedIndex;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: index == selectedIndex ? 2 : 0,
      color: index == selectedIndex ? Colors.grey.shade500 : Colors.black45,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        trailing: Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(2),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade100),
          ),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == selectedIndex ? textHeadlineSmall : null,
            ),
          ),
        ),
      ),
    );
  }
}
