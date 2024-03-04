import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/view/pages/home/views/dashbord/components/dashbord_app_bar.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        top: false,
        child: SizedBox(
          width: double.infinity,
          height: Get.size.height,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              const DashboardAppBar(),
              const WelcomeDashBord(),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.19,
                  color: Colors.amber,
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomPaint(
                          painter: BackGroundContainer(),
                          child: Container(
                            color: Colors.black12,
                          ),
                        ),
                      )
                    ],
                  ),

                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: size.height * 0.3,
                  child: const Center(
                    child: Text(
                      "Current Task with Report",
                    ),
                  ),
                  //color: Colors.amber,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.5,
                  color: Colors.amber.shade900,
                  child: const Center(
                    child: Text(
                      "charts with Statistique",
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * 0.05,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BackGroundContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 13,
    );
    const textSpan = TextSpan(
      text: 'Hello, world.',
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: size.width,
    );
    final offset = Offset(size.width - 120, size.height / 2 - 10);

    Path getClip(Size size) {
      Path path = Path();
      path.lineTo(0, size.height);
      path.lineTo(size.width, size.height);
      path.quadraticBezierTo(size.width - 100, size.height / 2, size.width, 0);
      path.lineTo(0, 0);
      path.close();
      return path;
    }

    Offset center = Offset(size.width - 80, size.height / 2);
    Paint paint = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 12
      ..style = PaintingStyle.stroke
      ..color = Colors.grey;
    Rect rect = Rect.fromLTRB(0, 0, 0, 0);
    Paint paint1 = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..color = Colors.purple;
    //canvas.clipRect(rect);
    //canvas.clipPath(getClip(size));
    canvas.drawCircle(center, 60, paint);
    canvas.drawCircle(center, 40, paint1);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class WelcomeDashBord extends StatelessWidget {
  const WelcomeDashBord({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            10,
          ),
          color: Colors.white,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Stack(
          children: [
            Positioned(
              right: -50,
              top: 10,
              bottom: 10,
              child: LottieBuilder.asset(
                "assets/animations/home.json",
                height: 70,
                repeat: false,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              left: 10,
              top: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bienvenue ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Amine Mejri",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Commencer votre \nMission de cette Semaine ",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
