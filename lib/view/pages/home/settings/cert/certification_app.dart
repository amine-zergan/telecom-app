import 'package:flutter/material.dart';

class LicenceApplication extends StatelessWidget {
  const LicenceApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Text(
          "Licence de l'application",
        ),
      )),
    );
  }
}
