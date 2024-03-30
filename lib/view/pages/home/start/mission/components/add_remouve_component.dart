import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/components/title_component.dart';
import 'package:telecom/view/theme/size_constants.dart';

class AddandRemouveComponent extends StatelessWidget {
  const AddandRemouveComponent({
    super.key,
    required this.title,
    this.increase,
    this.decrease,
    required this.bonCarburant,
  });
  final String title;
  final int bonCarburant;
  final VoidCallback? increase;
  final VoidCallback? decrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SubTitleComponent(
          title: title,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: decrease,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.grey.shade200,
                ),
              ),
              child: const Icon(
                Icons.remove_outlined,
                size: 20,
              ),
            ),
            const SizedBox(
              width: padding10 / 2,
            ),
            Text(
              bonCarburant.toString(),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              width: padding10 / 2,
            ),
            TextButton(
              onPressed: increase,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.grey.shade200,
                ),
              ),
              child: const Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ],
        )
      ],
    );
  }
}
