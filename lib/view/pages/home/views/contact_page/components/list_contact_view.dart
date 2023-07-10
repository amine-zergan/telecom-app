import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:telecom/model/entreprise/profile_and_contact/contact_model.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/empty_cantact_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ListContactView extends StatelessWidget {
  const ListContactView({
    Key? key,
    required this.controller,
  }) : super(key: key);
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
                    child: Slidable(
                      key: ValueKey(contact.id),
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          SlidableAction(
                            spacing: 2,
                            flex: 1,
                            onPressed: (BuildContext context) {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Voulez vous supprimer le contact de ${contact.name} ?",
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            "retour",
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.deleteContact(contact);

                                            Get.back();
                                          },
                                          child: const Text(
                                            "valider",
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            backgroundColor:
                                const Color.fromARGB(102, 123, 192, 67),
                            foregroundColor: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            icon: Icons.delete_outline_outlined,
                            label: 'supprimé ',
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(contact.name),
                        subtitle: Text(
                          contact.contact,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            controller.callmaintenance(
                              contact.contact,
                            );
                          },
                          child: LottieBuilder.asset(
                            "assets/animations/call.json",
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
