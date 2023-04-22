// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:telecom/view/pages/onboard/page/body_onboard.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("========= Onboard page ===========");
    return const Scaffold(
      body: BodyOnboard(),
    );
  }
}
