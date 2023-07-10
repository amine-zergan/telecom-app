import 'package:flutter/material.dart';
import 'package:telecom/utils/converter/enum/order_post.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/pages/home/start/site/components/title_section_component.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/contact_controller.dart';
import 'package:telecom/view/pages/home/views/contact_page/controllers/radio_order_model.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class FilterView extends StatelessWidget {
  const FilterView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ContactController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(
        top: padding10 * 1.5,
        left: padding10 * 1.5,
        right: padding10 * 1.5,
      ),
      height: size.height * 0.77,
      child: ListView(
        children: [
          const TitleComponent(
            title: "Filters de Recherche :",
          ),
          const SizedBox(
            height: 2 * padding10,
          ),
          Row(
            children: [
              const SubTitleComponent(
                title: "Limit de recherche :",
              ),
              const SizedBox(
                width: padding10,
              ),
              Text(
                controller.slider.toInt().toString(),
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              )
            ],
          ),
          const SizedBox(
            height: padding10 / 2,
          ),
          Slider(
            value: controller.slider,
            divisions: 10,
            activeColor: colorButton,
            inactiveColor: Colors.black12,
            min: 1,
            max: controller.maxLength,
            onChanged: controller.onChangedSlider,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "min : 1",
              ),
              Text(
                "max : ${controller.maxLength.toInt()}",
              ),
            ],
          ),
          const SizedBox(
            height: padding10,
          ),
          const SubTitleComponent(
            title: "poste Occupée :",
          ),
          const SizedBox(
            height: padding10,
          ),
          Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: controller.posts
                .map(
                  (post) => FilterChip(
                    selected: controller.filters.contains(post),
                    onSelected: (value) {
                      controller.onSelectedChip(value, post);
                    },
                    elevation: 5,
                    label: Text(post),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: padding10,
          ),
          const TitleComponent(
            title: "Orders par :",
          ),
          const SizedBox(
            height: padding10,
          ),
          ...List.generate(
            ordermodelsList.length,
            (index) => Row(
              children: [
                Radio<OrderContact>(
                  activeColor: colorButton,
                  value: ordermodelsList[index].contact,
                  groupValue: controller.order,
                  onChanged: controller.onChangedOrder,
                ),
                const SizedBox(
                  width: padding10 / 2,
                ),
                Text(
                  ordermodelsList[index].title,
                )
              ],
            ),
          ),
          const SizedBox(
            height: padding10,
          ),
        ],
      ),
    );
  }
}
