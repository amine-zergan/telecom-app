// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:linearprogress/linearprogress.dart';
import 'package:telecom/view/pages/config/components/appbar_widget.dart';
import 'package:telecom/view/pages/config/contract_page.dart';
import 'package:telecom/view/pages/config/post_page.dart';
import 'package:telecom/view/pages/config/niveau_page.dart';
import 'package:telecom/view/pages/config/controller/config_controller.dart';
import 'package:telecom/view/pages/config/salaire_de_entreprise.dart';

class ConfigPage extends StatefulWidget {
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  double value = 0.0;
  late PageController _controller;
  int _page = 0;
  @override
  void initState() {
    // ignore: avoid_print
    print("============ init state configPage ==============");
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        index: value,
      ),
      body: SafeArea(
        bottom: false,
        child: GetBuilder<ConfigController>(builder: (controller) {
          // ignore: avoid_print
          print("=========== Getbuilder widget ==============");
          return SingleChildScrollView(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: Get.height,
              child: PageView(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _page = index;
                  });
                },
                children: const [
                  NiveauPage(),
                  PostPage(),
                  ContractPage(),
                  SalairePage(),
                ],
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {});
          _controller.animateToPage(_page + 1,
              duration: const Duration(milliseconds: 600),
              curve: Curves.easeIn);
          value = value + 0.2;
        },
        icon: const Icon(Icons.arrow_circle_right),
        backgroundColor: Colors.white,
        label: const Text(
          "next",
        ),
      ),
    );
  }
}
