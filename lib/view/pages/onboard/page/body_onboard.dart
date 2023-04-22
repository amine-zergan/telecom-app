import 'package:flutter/material.dart';

import '../components/body_page_view.dart';
import '../components/bottom_widget.dart';
import '../data_onboard.dart';

class BodyOnboard extends StatefulWidget {
  const BodyOnboard({super.key});

  @override
  State<BodyOnboard> createState() => _BodyOnboardState();
}

class _BodyOnboardState extends State<BodyOnboard> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("============ SetState ============");
    return SafeArea(
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
    );
  }
}
