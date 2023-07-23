import 'package:flutter/material.dart';
import 'package:telecom/view/theme/size_constants.dart';

class EmptyNavigationView extends StatelessWidget {
  const EmptyNavigationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: padding10,
          ),
          const Icon(
            Icons.add_road_rounded,
            size: 100,
          ),
          const SizedBox(
            height: padding10,
          ),
          Text(
            "Aucune Site trouvé",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: padding10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: padding10 * 1.5,
            ),
            child: Text(
              "Mettre les coordonnées de site ou destination souhaitée. Créer et Ajouter les sites des Operateurs.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
