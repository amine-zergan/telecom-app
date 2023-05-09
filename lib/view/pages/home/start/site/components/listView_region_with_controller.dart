// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:telecom/data/post_data.dart';
import 'package:telecom/view/pages/home/start/site/components/card_region.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ListViewRegionWithController extends StatelessWidget {
  const ListViewRegionWithController({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final CreateSiteController controller;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 50,
      margin: const EdgeInsets.only(
        top: padding10,
      ),
      child: ListView.builder(
        itemCount: region.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String nom = region[index];
          return CardRegion(
            nom: nom,
            controller: controller,
            index: index,
          );
        },
      ),
    );
  }
}
