import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:telecom/di/get_it.dart';
import 'package:telecom/view/pages/config/config_page.dart';
import 'package:telecom/view/pages/config/controller/config_binding.dart';
import 'package:telecom/view/pages/home/controller/home_binding.dart';
import 'package:telecom/view/pages/home/dashbord/sound/notification_page.dart';
import 'package:telecom/view/pages/home/dashbord/tasks/history_view/history_page.dart';
import 'package:telecom/view/pages/home/new_home_page.dart';
import 'package:telecom/view/pages/home/settings/edit_settings/edit_profil_entreprise/edit_profil_entreprise.dart';
import 'package:telecom/view/pages/home/settings/edit_settings/edit_profil_user/edit_profil.dart';
import 'package:telecom/view/pages/home/settings/edit_settings/edit_settings_page.dart';
import 'package:telecom/view/pages/home/start/add_page.dart';
import 'package:telecom/view/pages/home/start/contact/create_contact.dart';
import 'package:telecom/view/pages/home/start/equipements/controller/create_equipement_binding.dart';
import 'package:telecom/view/pages/home/start/equipements/create_equipements.dart';
import 'package:telecom/view/pages/home/start/mission/controller/create_mission_binding.dart';
import 'package:telecom/view/pages/home/start/mission/create_mission.dart';
import 'package:telecom/view/pages/home/start/site/controller/create_site_binding.dart';
import 'package:telecom/view/pages/home/start/site/create_site.dart';
import 'package:telecom/view/pages/home/start/tasks/controller/create_task_binding.dart';
import 'package:telecom/view/pages/home/start/tasks/create_task.dart';
import 'package:telecom/view/pages/onboard/controller/onboard_bind.dart';
import 'package:telecom/view/pages/onboard/middleware/onboard_middleware_config.dart';
import 'package:telecom/view/routes/route_name.dart';
import '../pages/home/start/contact/controller/contact_binding.dart';
import '../pages/onboard/page/onboard_page.dart';

class Routes {
  Routes._();
  static List<GetPage> routes = [
    GetPage(
        name: RouteName.onboard,
        page: () => const OnboardPage(),
        binding: OnboardBind(),
        middlewares: [
          WelcomeMiddleware(
            repos: getItInstance(),
            priority: 1,
          ),
        ]),
    GetPage(
      name: RouteName.config,
      page: () => const ConfigPage(),
      binding: ConfigBind(),
    ),
    GetPage(
        name: RouteName.home,
        page: () => const HomeNewPage(),
        binding: HomeBinding(),
        children: const []),
    GetPage(
      name: RouteName.history,
      page: () => const HistoryPage(),
    ),
    GetPage(
      name: RouteName.notification,
      page: () => const NotificationPage(),
    ),
    GetPage(
      name: RouteName.editSetting,
      page: () => const EditSetting(),
    ),
    GetPage(
      name: RouteName.editProfil,
      page: () => const EditProfilUser(),
    ),
    GetPage(
      name: RouteName.editEntreprise,
      page: () => const EditProfilEntreprise(),
    ),

    /// add create pages : tasks -Missions -report -site- contact
    ///
    GetPage(
      name: RouteName.createPage,
      page: () => const CreateObjectPage(),
      transition: Transition.fadeIn,
      curve: Curves.elasticInOut,
    ),
    GetPage(
      name: RouteName.startMission,
      page: () => const StartMission(),
      binding: CreateMissionBinding(),
    ),
    GetPage(
      name: RouteName.startContact,
      page: () => const StartContact(),
      binding: Contactbinding(),
    ),
    GetPage(
      name: RouteName.startSite,
      page: () => const StartSite(),
      binding: CreateSiteBinding(),
    ),
    GetPage(
      name: RouteName.startTask,
      page: () => const StartTask(),
      binding: CreateTaskBinding(),
    ),
    GetPage(
      name: RouteName.startMaterial,
      page: () => const StartMaterial(),
      binding: CreateEquipementBinding(),
    ),
  ];
}
