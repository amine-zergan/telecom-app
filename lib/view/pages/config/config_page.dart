// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';

import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/theme/color_constants.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final value = 0.8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        value: value,
      ),
      body: SafeArea(
        child: GetBuilder<ConfigController>(builder: (controller) {
          // ignore: avoid_print
          print("=========== Getbuilder widget ==============");
          return Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 500,
          );
        }),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    required this.value,
  }) : super(key: key);
  final double value;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: TweenAnimationBuilder<double>(
          tween: Tween(begin: 0.0, end: value),
          duration: const Duration(milliseconds: 1500),
          curve: Curves.linear,
          builder: (context, value, child) {
            return LinearProgress(
              value: value,
              background: backgroundColor,
              forground: Colors.amberAccent,
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              gradient: true,
              gradients: const [beginColor, endColor],
            );
          }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
