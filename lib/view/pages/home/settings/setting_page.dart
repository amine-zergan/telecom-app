// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //color: Colors.white54,
        width: double.infinity,
        height: Get.size.height,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              delegate: ProfilePersistHeader(),
              pinned: true,
              floating: false,
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const maxHeigth = 400.0;
const minHeigth = 100.0;

class ProfilePersistHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final value = shrinkOffset / maxHeigth;
    // ignore: avoid_print
    print(-30 * value);
    return Container(
      color: Colors.grey,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: (-100 * (0.8 * (0.8 - value))) - 30 * value,
            left: 50 - 50 * value,
            width: 70 + 200 * (1 - value),
            height: 70 + 200 * (1 - value),
            child: LottieBuilder.asset(
              "assets/animations/profil.json",
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => maxHeigth;

  @override
  double get minExtent => minHeigth;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
