// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:linearprogress/linearprogress.dart';
import 'package:telecom/view/pages/config/components/appbar_component.dart';
import 'package:telecom/view/pages/config/components/body_config_view.dart';
import 'package:telecom/view/pages/config/components/float_button_config.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (controller) {
        return KeyboardDismisser(
          gestures: const [
            GestureType.onTap,
            GestureType.onPanUpdateDownDirection,
          ],
          child: Scaffold(
            appBar: AppBarWidget(
              index: controller.value,
            ),
            body: BodyConfigView(
              controller: controller,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatButton(
              controller: controller,
            ),
          ),
        );
      },
    );
  }
}
