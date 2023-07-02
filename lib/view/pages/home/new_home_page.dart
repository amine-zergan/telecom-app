// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:telecom/view/pages/home/views/contact_page/contact_page.dart';
import 'package:telecom/view/pages/home/views/navigation/dashbord/dashbord_page.dart';
import 'package:telecom/view/pages/home/views/navigation/navigation_page.dart';
import 'package:telecom/view/pages/home/views/settings/setting_page.dart';
import 'package:telecom/view/routes/route_name.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class HomeNewPage extends StatefulWidget {
  const HomeNewPage({super.key});

  @override
  State<HomeNewPage> createState() => _HomeNewPageState();
}

class _HomeNewPageState extends State<HomeNewPage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: currentIndex,
          children: const [
            DashbordPage(),
            ContactPage(),
            NavigationPage(),
            SettingPage(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        onPressed: () {
          Get.toNamed(RouteName.createPage);
        },
        backgroundColor: colorButton,
        child: const Icon(
          Icons.add,
          size: 25,
          color: Colors.white,
        ),
      ),
      //drawer: const Drawer(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        color: Colors.grey.shade800,
        elevation: 20,
        padding: const EdgeInsets.only(
          left: padding10,
          top: padding10 / 2,
          right: padding10,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
              },
              child: BottomNavItem(
                currentIndex: currentIndex,
                index: 0,
                icon: Icons.dashboard_outlined,
                label: "Dashbord",
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
              },
              child: BottomNavItem(
                index: 1,
                currentIndex: currentIndex,
                label: "Contact",
                icon: Icons.phone_outlined,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
              },
              child: BottomNavItem(
                index: 2,
                currentIndex: currentIndex,
                label: "Navigation",
                icon: Icons.gps_fixed_rounded,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = 3;
                });
              },
              child: BottomNavItem(
                index: 3,
                currentIndex: currentIndex,
                label: "Profile",
                icon: Icons.person_add_alt_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.currentIndex,
    required this.label,
    required this.index,
    required this.icon,
  }) : super(key: key);

  final int currentIndex;
  final String label;
  final int index;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: currentIndex == index ? Colors.white : Colors.grey,
          size: currentIndex == index ? 25 : 20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: currentIndex == index ? Colors.white : Colors.grey,
                  fontWeight:
                      currentIndex == index ? FontWeight.w700 : FontWeight.w700,
                ),
          ),
        )
      ],
    );
  }
}
