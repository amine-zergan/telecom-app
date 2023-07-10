import 'package:flutter/material.dart';
import 'package:telecom/view/components/loading/loading_components.dart';

class LoadingDataContact extends StatelessWidget {
  const LoadingDataContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: SizedBox(
        height: size.height * 0.7,
        width: size.width,
        child: const LoadingWidget(),
      ),
    );
  }
}
