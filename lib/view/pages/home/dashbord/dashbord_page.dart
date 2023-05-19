import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/theme/size_constants.dart';

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
          physics: const ClampingScrollPhysics(),
          slivers: [
            const SliverAppBar(
              expandedHeight: 200,
              collapsedHeight: 70,
              pinned: false,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Dashborad"),
                titlePadding: EdgeInsets.symmetric(
                    horizontal: padding10 * 1.5, vertical: padding10),
                centerTitle: false,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 700,
                //color: Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
