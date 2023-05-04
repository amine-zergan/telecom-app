import 'package:flutter/material.dart';

import '../components/app_bar_view.dart';

class StartMission extends StatelessWidget {
  const StartMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Creation Mission",
        validate: () {},
      ),
    );
  }
}
