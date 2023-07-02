// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/contact_page/contact_page.dart';
import 'package:telecom/view/pages/home/views/dashbord/dashbord_page.dart';
import 'package:telecom/view/pages/home/views/navigation/navigation_page.dart';
import 'package:telecom/view/pages/home/views/settings/setting_page.dart';
import 'package:telecom/view/pages/home/start/add_page.dart';
import 'package:telecom/view/theme/color_constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isdrag = false;
  Offset offset = const Offset(0.0, 0.0);
  double _translation = 40.0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //backgroundColor: Colors.grey.shade800,
      drawer: const Drawer(
        elevation: 0,
      ),
      appBar: AppBar(
        title: const Text("Telecom App"),
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        top: false,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInCubic,
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AnimatedOpacity(
                  curve: Curves.easeIn,
                  duration: const Duration(milliseconds: 100),
                  opacity: isdrag ? 0.7 : 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IndexedStack(
                        index: selectedIndex,
                        children: const [
                          DashbordPage(),
                          ContactPage(),
                          NavigationPage(),
                          SettingPage(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    bottom: 45.0,
                  ),
                  child: NavigationBottom(
                    isdrag: isdrag,
                    select: selectedIndex,
                    onpress: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
              ),
              isdrag
                  ? AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.elasticOut,
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipPath(
                        clipper: Background(offset: offset),
                        child: Container(
                          color: Colors.grey.shade800,
                          width: double.infinity,
                          height: size.height,
                        ),
                      ),
                    )
                  : Container(),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 50),
                curve: Curves.linearToEaseOut,
                left: size.width / 2 - 50,
                bottom: _translation,
                right: size.width / 2 - 50,
                child: GestureDetector(
                  onVerticalDragStart: ((details) {
                    setState(
                      () {
                        isdrag = true;
                        offset = details.localPosition;
                        _translation = 40;
                      },
                    );
                  }),
                  onVerticalDragUpdate: (details) {
                    setState(
                      () {
                        offset = details.localPosition;
                        _translation = 30 + (-details.localPosition.dy);
                      },
                    );
                  },
                  onVerticalDragEnd: (details) {
                    setState(() {
                      offset = const Offset(51.0, 70.7);
                    });
                    Get.to<double>(() => const CreateObjectPage(),
                            transition: Transition.fadeIn,
                            curve: Curves.elasticInOut,
                            duration: const Duration(milliseconds: 200))!
                        .then(
                      (value) {
                        setState(
                          () {
                            isdrag = false;
                            _translation = 40;
                            offset = const Offset(0.0, 0.0);
                          },
                        );
                      },
                    );
                  },
                  child: FloatingActionButton(
                    elevation: 15,
                    backgroundColor: colorButton,
                    tooltip: "Ajouter",
                    onPressed: () async {
                      double? position = await Get.to<double>(
                          () => const CreateObjectPage(),
                          transition: Transition.fadeIn,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.elasticInOut);
                      setState(() {
                        _translation = position!;
                      });
                    },
                    child: const Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationBottom extends StatefulWidget {
  NavigationBottom({
    super.key,
    required this.isdrag,
    required this.select,
    required this.onpress,
  });

  final bool isdrag;
  late int select;
  Function(int) onpress;
  @override
  State<NavigationBottom> createState() => _NavigationBottomState();
}

class _NavigationBottomState extends State<NavigationBottom> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      transform: Matrix4.translationValues(0, 30, 0),
      padding: const EdgeInsets.only(left: 20, right: 20),
      curve: Curves.easeInOut,
      child: Opacity(
        opacity: widget.isdrag ? 0.6 : 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavigationItem(
              icon: Icons.add_chart_outlined,
              label: "Dashbord",
              onTap: () {
                setState(() {
                  widget.select = 0;
                });
              },
              onpress: widget.onpress,
              index: 0,
              select: widget.select == 0,
              selectedColor: Colors.white,
              unselectedColor: Colors.black,
            ),
            const SizedBox(
              width: 20,
            ),
            BottomNavigationItem(
              onTap: () {
                setState(() {
                  widget.select = 1;
                });
              },
              onpress: widget.onpress,
              index: 1,
              label: "paramatre",
              icon: Icons.contact_page_outlined,
              select: widget.select == 1,
              selectedColor: Colors.white,
              unselectedColor: Colors.black,
            ),
            const SizedBox(
              width: 50,
            ),
            BottomNavigationItem(
              onTap: () {
                setState(() {
                  widget.select = 2;
                });
              },
              onpress: widget.onpress,
              index: 2,
              label: "Navigation",
              icon: Icons.navigation_outlined,
              select: widget.select == 2,
              selectedColor: Colors.white,
              unselectedColor: Colors.black,
            ),
            const SizedBox(
              width: 30,
            ),
            BottomNavigationItem(
              onpress: widget.onpress,
              index: 3,
              onTap: () {
                setState(() {
                  widget.select = 3;
                });
              },
              label: "Profil",
              select: widget.select == 3,
              icon: Icons.person_add_alt_1_outlined,
              selectedColor: Colors.white,
              unselectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.onTap,
    required this.onpress,
    required this.select,
    required this.index,
    required this.icon,
    required this.label,
    this.selectedColor,
    this.unselectedColor,
  }) : super(key: key);
  final VoidCallback onTap;
  final Function(int) onpress;
  final bool select;
  final int index;
  final IconData icon;
  final String label;
  final Color? selectedColor;
  final Color? unselectedColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 800),
      curve: Curves.elasticInOut,
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(5.0),
              onTap: () {
                onTap();
                onpress(index);
              },
              child: Icon(
                icon,
                size: select ? 32 : 27,
                color: select ? selectedColor : unselectedColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                label,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: select ? selectedColor : unselectedColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Background extends CustomClipper<Path> {
  final Offset? offset;
  Background({
    this.offset,
  });
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2 - 30, size.height - 10,
        size.width / 2 - 30, size.height + offset!.dy - 50);
    path.conicTo(size.width / 2, size.height + offset!.dy - 120,
        size.width / 2 + 30, size.height + offset!.dy - 50, 0.6);
    path.quadraticBezierTo(
        size.width / 2 + 30, size.height - 10, size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
