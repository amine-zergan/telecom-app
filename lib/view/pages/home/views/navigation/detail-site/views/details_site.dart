// ignore_for_file: must_be_immutable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/model/site/site_model.dart';

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
    print("=========== site fetched from navigation $site");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          width: double.infinity,
          height: size.height,
          color: Colors.amber,
        ),
      ),
    );
  }
}
