import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';

class StartMaterial extends StatelessWidget {
  const StartMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Nouveau Equipement",
        validate: () {},
      ),
      body: SafeArea(
        child: ListView(
          children: const [],
        ),
      ),
    );
  }
}
