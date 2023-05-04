import 'package:flutter/material.dart';

import '../components/app_bar_view.dart';

class StartTask extends StatelessWidget {
  const StartTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Ajouter une Tachée",
        validate: () {},
      ),
    );
  }
}
