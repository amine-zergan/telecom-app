// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';

import 'package:telecom/view/pages/config/components/appbar_widget.dart';
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

class FloatButton extends StatelessWidget {
  const FloatButton({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ConfigController controller;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: controller.navigatePageController,
      icon: controller.getLastPage()
          ? const Icon(Icons.done_all)
          : const Icon(Icons.arrow_circle_right),
      backgroundColor: Colors.white,
      label: Text(
        controller.getLastPage() ? "Done" : "Next",
      ),
    );
  }
}
