// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:telecom/view/pages/onboard/data_onboard.dart';

import '../components/body_page_view.dart';
import '../components/bottom_widget.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: PageView.builder(
                itemCount: dataOnboard.length,
                onPageChanged: (value) {
                  setState(() {
                    selectIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  final onbard = dataOnboard[index];
                  return BodyPageView(onbard: onbard);
                },
              ),
            ),
            ButtomWidget(selectIndex: selectIndex)
          ],
        ),
      ),
    );
  }
}
