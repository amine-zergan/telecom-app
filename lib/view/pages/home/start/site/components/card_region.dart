import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class CardRegion extends StatelessWidget {
  const CardRegion({
    super.key,
    required this.nom,
    required this.controller,
    required this.index,
  });

  final String nom;
  final CreateSiteController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(right: 10),
      color: controller.selectedRegion == index ? Colors.white : Colors.black26,
      child: InkWell(
        onTap: () {
          controller.updateSelectedRegion(index);
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 1.5 * padding10),
            child: Text(
              nom,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: controller.selectedRegion == index
                        ? Colors.black
                        : Colors.white,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
