// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ConfigController controller;
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
      children: [
        const TitleConfig(
          title: "Quel est votre Poste Actuel ?",
        ),
        ...List.generate(occupations.length, (index) {
          String occupation = occupations[index];
          return CardChoix(
            index: index,
            selectedIndex: controller.selectPoste,
            onTap: () {
              controller.updatePoste(index, occupation);
            },
            title: occupation,
          );
        }),
        const SizedBox(
          height: 150,
        )
      ],
    );
  }
}
