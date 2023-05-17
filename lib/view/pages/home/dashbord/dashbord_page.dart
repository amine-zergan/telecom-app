import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashbordPage extends StatelessWidget {
  const DashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: Get.size.height,
        //color: Colors.white,
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              expandedHeight: 300,
              collapsedHeight: 70,
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Dashborad"),
                centerTitle: false,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
