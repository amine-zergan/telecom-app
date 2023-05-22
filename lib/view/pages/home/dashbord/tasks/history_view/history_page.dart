import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/components/app_bar_view.dart';
import 'package:telecom/view/theme/size_constants.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCreate(
        title: "Historique",
        validate: () {},
        icon: Icons.delete_outlined,
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: double.infinity,
          height: size.height,
          child: Column(
            children: [
              const Spacer(),
              const Icon(
                Icons.history,
                size: 80,
              ),
              const SizedBox(
                height: padding10,
              ),
              Text(
                "Aucun Historique Trouvé .",
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
