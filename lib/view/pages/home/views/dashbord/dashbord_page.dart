// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:telecom/view/pages/home/views/dashbord/components/dashbord_app_bar.dart';
import 'package:telecom/view/pages/home/views/dashbord/components/welcome_component.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
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
                  height: size.height * 0.2,
                  color: Colors.grey,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  child: GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1.0,
                    children: const [
                      CardMission(
                        title: "Mission Complete",
                        icon: Icons.timer_outlined,
                        value: "200",
                        color: Colors.white,
                      ),
                      CardMission(
                        title: "Taches effectues",
                        icon: Icons.timer_off_outlined,
                        value: "200",
                        color: Colors.white,
                      ),
                      CardMission(
                        title: "kilometrage",
                        icon: Icons.car_rental_rounded,
                        value: "200",
                        color: Colors.white,
                      ),
                      CardMission(
                        title: "Carburant",
                        icon: Icons.card_giftcard,
                        value: "200",
                        color: Colors.white,
                      ),
                    ],
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

class CardMission extends StatelessWidget {
  const CardMission({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String value;
  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              icon,
              size: 50,
              color: const Color.fromARGB(209, 59, 91, 150),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                ),
          )
        ],
      ),
    );
  }
}

class CustomPathClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(10, size.height * 0.85);
    path.lineTo(size.width * 0.7, size.height * 0.85);
    path.quadraticBezierTo(
        size.width * 0.7 - 100, size.height / 2, size.width, 10);
    path.lineTo(10, 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class BackGroundContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path getClip(Size size) {
      Path path = Path();
      path.lineTo(10, size.height * 0.95);
      path.lineTo(size.width * 0.7, size.height * 0.95);
      path.quadraticBezierTo(size.width * 0.7 - 90, 70, size.width * 0.72, 0);
      path.close();
      return path;
    }

    Offset center = Offset(size.width - 80, size.height / 2);

    Paint paint = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke
      ..color = Colors.grey;
    Paint paint1 = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..color = Colors.blueAccent;
    Paint paintRect = Paint()
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.square
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 128, 103, 201);

    Rect rect = Rect.fromLTWH(10, 10, size.width, size.height * 0.85);
    canvas.drawCircle(center, 60, paint);
    canvas.drawCircle(center, 50, paint1);
    canvas.clipPath(getClip(size));
    canvas.drawRect(rect, paintRect);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
