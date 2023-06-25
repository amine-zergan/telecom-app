// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'dart:math' as math;
import 'package:telecom/view/components/Form_Fields/Longitude_form_field.dart';
import 'package:telecom/view/components/Form_Fields/latitude_form_field.dart';
import 'package:telecom/view/pages/home/navigation/components/search_delegate.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      body: SizedBox(
        //color: const Color.fromARGB(137, 250, 125, 125),
        width: double.infinity,
        height: Get.size.height,
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              elevation: 0,
              pinned: true,
              floating: true,
              snap: true,
              actions: [
                const NavigatorIconButton(),
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: NavigationSearch(),
                    );
                  },
                  splashRadius: 20,
                  icon: const Icon(
                    Icons.search_outlined,
                    color: Colors.black,
                  ),
                ),
              ],
              backgroundColor: Colors.grey.shade800,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    LottieBuilder.asset(
                      "assets/animations/maps.json",
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black12,
                            Colors.black26,
                            Colors.black38,
                            Colors.black45,
                            Colors.black54,
                            Colors.black87.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                expandedTitleScale: 1.5,
                title: const Text(
                  "Navigation",
                ),
                titlePadding: const EdgeInsets.only(
                  bottom: padding10,
                  left: padding10,
                ),
                centerTitle: false,
                collapseMode: CollapseMode.pin,
              ),
            ),
            const EmptyNavigationView(),
          ],
        ),
      ),
    );
  }
}

class NavigatorIconButton extends StatelessWidget {
  const NavigatorIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) {
              return const SearchComponent();
            });
      },
      splashRadius: 20,
      icon: Transform.rotate(
        angle: math.pi / 6.0,
        child: const Icon(
          Icons.navigation_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
}

class EmptyNavigationView extends StatelessWidget {
  const EmptyNavigationView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: padding10,
            ),
            const Icon(
              Icons.add_road_rounded,
              size: 100,
            ),
            const SizedBox(
              height: padding10,
            ),
            Text(
              "Aucune Site trouvé",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: padding10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: padding10 * 1.5,
              ),
              child: Text(
                "Mettre les coordonnées de site ou destination souhaitée. Créer et Ajouter les sites des Operateurs.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey.shade500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Choisi Votre destination",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 2 * padding10,
          ),
          LatitudeFormField(
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: padding10,
          ),
          LongitudeFormField(
            controller: TextEditingController(),
          ),
          const SizedBox(
            height: padding10,
          ),
          Center(
            child: MaterialButton(
              onPressed: () {},
              elevation: 0,
              color: colorButton.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: padding10 * 0.75,
              ),
              minWidth: size.width * 0.5,
              child: Text(
                "commencer",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
