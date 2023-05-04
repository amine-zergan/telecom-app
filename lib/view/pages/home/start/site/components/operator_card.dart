import 'package:flutter/material.dart';
import 'package:telecom/view/pages/home/start/site/data/class_operator_model.dart';

import '../../../../../theme/size_constants.dart';

class OperatorCard extends StatelessWidget {
  const OperatorCard({
    Key? key,
    required this.selectedIndex,
    required this.model,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int? selectedIndex;
  final OperatorEntity model;
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.only(
          right: padding10 / 2,
        ),
        color: selectedIndex == index ? Colors.white70 : Colors.black12,
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Image.asset(
                    model.image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    model.name,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
