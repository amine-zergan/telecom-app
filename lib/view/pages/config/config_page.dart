// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';

import 'package:telecom/view/pages/config/components/appbar_component.dart';
import 'package:telecom/view/pages/config/components/float_button_config.dart';
import 'package:telecom/view/pages/config/contract_page.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/entreprise_page.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/pages/config/post_page.dart';
import 'package:telecom/view/pages/config/profil_page.dart';
import 'package:telecom/view/pages/config/salaire_de_entreprise.dart';
import 'package:telecom/view/pages/config/taille_entreprise.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ConfigController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBarWidget(
            index: controller.value,
          ),
          body: SafeArea(
            bottom: false,
            child: GetBuilder<ConfigController>(
              builder: (controller) {
                return SingleChildScrollView(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: Get.height,
                    child: PageView(
                      controller: controller.pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      onPageChanged: controller.updateCurrentPage,
                      // replaced with setState: in stful widget ..
                      children: const [
                        NiveauPage(),
                        PostPage(),
                        ContractPage(),
                        SalairePage(),
                        TaillePage(),
                        ProfilePage(),
                        ProfileEntreprisePage(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: FloatButton(controller: controller),
        );
      },
    );
  }
}
