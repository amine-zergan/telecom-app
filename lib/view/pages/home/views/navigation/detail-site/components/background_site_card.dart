import 'package:flutter/material.dart';

class BackgroudSiteInfoCard extends StatelessWidget {
  const BackgroudSiteInfoCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 0,
      left: 0,
      child: Container(
        height: size.height * 0.6,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/route.png",
            ),
            filterQuality: FilterQuality.high,
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.9),
                Colors.white.withOpacity(0.7),
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.3),
                Colors.white.withOpacity(0.1),
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
          ),
        ),
      ),
    );
  }
}
