import 'package:flutter/material.dart';

class BlurEffectIamge extends StatelessWidget {
  const BlurEffectIamge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.black26,
            Colors.black38,
            Colors.black45,
            Colors.black54,
            Colors.black87.withOpacity(0.7),
          ],
        ),
      ),
    );
  }
}
