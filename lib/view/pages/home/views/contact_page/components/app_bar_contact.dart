import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telecom/view/pages/home/views/contact_page/components/filter_view.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/theme/size_constants.dart';

class AppBarContact extends StatelessWidget {
  const AppBarContact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      elevation: 0,
      backgroundColor: Colors.grey.shade100,
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
                return GetBuilder<ContactController>(builder: (controller) {
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
      flexibleSpace: FlexibleSpaceBar(
        expandedTitleScale: 1.4,
        titlePadding: const EdgeInsets.only(
          bottom: padding10,
          left: padding10,
        ),
        title: Text(
          "Repertoire de contact",
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: false,
        collapseMode: CollapseMode.none,
      ),
    );
  }
}
