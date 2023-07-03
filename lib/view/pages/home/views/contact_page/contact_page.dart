// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/empty_cantact_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/filter_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        //color: Colors.amber.shade200,
        width: double.infinity,
        height: Get.size.height,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              elevation: 0,
              floating: true,
              snap: true,
              actions: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isDismissible: true,
                      context: context,
                      useSafeArea: false,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            padding10 * 2,
                          ),
                          topRight: Radius.circular(
                            padding10 * 2,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return GetBuilder<ContactController>(
                            builder: (controller) {
                          return FilterView(
                            controller: controller,
                          );
                        });
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 2.0,
                    ),
                    child: Icon(
                      Icons.segment_outlined,
                    ),
                  ),
                ),
                const SizedBox(
                  width: padding10,
                )
              ],
              flexibleSpace: const FlexibleSpaceBar(
                expandedTitleScale: 1.4,
                titlePadding: EdgeInsets.only(
                  bottom: padding10,
                  left: padding10,
                ),
                title: Text(
                  "Repertoire de contact",
                  textAlign: TextAlign.left,
                ),
                centerTitle: false,
                collapseMode: CollapseMode.none,
              ),
            ),
            const EmptyContactCard(),
          ],
        ),
      ),
    );
  }
}
