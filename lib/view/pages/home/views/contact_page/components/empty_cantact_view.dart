import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/theme/size_constants.dart';

class EmptyContactCard extends StatelessWidget {
  const EmptyContactCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: Get.height * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_people_rounded,
              size: 150,
            ),
            const SizedBox(
              height: padding10,
            ),
            Text(
              "Repertoire vide",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: padding10,
            ),
            Text(
              "Commencer d'ajouter votre Contacts.\nOrganiser selon leur post occupée ",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey.shade500,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
