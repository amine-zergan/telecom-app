import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/start/mission/components/body_create_mission.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_controller.dart';
import '../components/app_bar_view.dart';

// ignore: must_be_immutable
class StartMission extends GetWidget<CreateMissionController> {
  const StartMission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCreate(
        title: "Creation Mission",
        validate: () async {
          controller.insertMissionToDb();
        },
      ),
      body: const BodyCreateMission(),
    );
  }
}


///! note :
//! replace CupertinoTextField to List of contact 
///!