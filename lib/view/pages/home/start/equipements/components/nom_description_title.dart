import 'package:flutter/material.dart';

import '../../../../../theme/size_constants.dart';
import '../../site/components/title_section_component.dart';

class NomAndDescriptionTitle extends StatelessWidget {
  const NomAndDescriptionTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: padding10,
        ),
        TitleComponent(
          title: "Nom et description :",
        ),
        SizedBox(
          height: 2 * padding10,
        ),
      ],
    );
  }
}
