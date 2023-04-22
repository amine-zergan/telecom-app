import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:telecom/view/pages/onboard/data_onboard.dart';
import 'package:telecom/view/theme/size_constants.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: dataOnboard.length,
          itemBuilder: (context, index) {
            final onbard = dataOnboard[index];
            return Padding(
              padding: const EdgeInsets.all(padding10),
              child: Column(
                children: [
                  const Spacer(),
                  Expanded(
                    child: Text(
                      onbard.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: SvgPicture.asset(onbard.image),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Expanded(
                    child: Text(
                      onbard.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          letterSpacing: 0.8, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
