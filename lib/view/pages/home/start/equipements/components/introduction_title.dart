import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/intro_title_page.dart';

import '../../../../../theme/size_constants.dart';

class IntroductionTitle extends StatelessWidget {
  const IntroductionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 1.5 * padding10,
      ),
      child: Introtitle(
        title:
            "Commencer a ajouter les equipements pour generer les Rapports de livraison et de retour materials.",
      ),
    );
  }
}
