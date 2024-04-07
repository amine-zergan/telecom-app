// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/model/site/site_model.dart';
import 'package:telecom/view/pages/home/views/navigation/detail-site/components/background_site_card.dart';
import 'package:telecom/view/pages/home/views/navigation/detail-site/components/site_detail_info_card.dart';
import 'package:telecom/view/pages/home/views/navigation/detail-site/views/controllers/detail_site_controller.dart';

class DetailSite extends StatefulWidget {
  const DetailSite({super.key});

  @override
  State<DetailSite> createState() => _DetailSiteState();
}

class _DetailSiteState extends State<DetailSite> {
  late Site site;
  @override
  void initState() {
    site = Get.arguments;
    print("=========== site fetched from navigation ");
    super.initState();
  }

  @override
  void dispose() {
    print("called function when we close the page");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.find<DetailSiteController>().navigateToSite(
            site.latitude,
            site.longitude,
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.gps_fixed_outlined,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: Text(
          site.name.toUpperCase(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Stack(
            children: [
              BackgroudSiteInfoCard(
                size: size,
              ),
              SiteDetailInfoCard(
                size: size,
                site: site,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
