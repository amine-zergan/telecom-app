import 'package:flutter/material.dart';

class AproposApplication extends StatelessWidget {
  const AproposApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Apropos application",
          ),
        ),
      ),
    );
  }
}
