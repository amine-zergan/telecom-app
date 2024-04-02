import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';

import 'package:telecom/view/pages/home/views/contact_page/components/empty_cantact_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ListContactView extends StatelessWidget {
  const ListContactView({
    super.key,
    required this.controller,
  });
  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(
        top: padding10,
      ),
      sliver: controller.contacts.isEmpty
          ? const EmptyContactCard()
          : SliverOpacity(
              opacity: controller.loading ? 0 : 1,
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 5,
                  crossAxisSpacing: 10,
                ),
                itemCount: controller.contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = controller.contacts[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      10,
                    )),
                    margin: const EdgeInsets.only(
                      bottom: 5.0,
                      right: padding10 / 2,
                      left: padding10 / 2,
                    ),
                    child: ListTile(
                      title: Text(contact.name),
                      subtitle: Text(contact.contact),
                      trailing: LottieBuilder.asset(
                        "assets/animations/call.json",
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
