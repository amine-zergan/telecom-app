import 'package:flutter/material.dart';
import 'package:telecom/model/components/project/operator_model.dart';
import '../../../../../theme/size_constants.dart';

class OperatorCard extends StatelessWidget {
  const OperatorCard({
    super.key,
    required this.selectedIndex,
    required this.model,
    required this.index,
    required this.onTap,
  });

  final int? selectedIndex;
  final Operator model;
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: selectedIndex == index ? 5 : 0,
        shape: RoundedRectangleBorder(
          side: selectedIndex == index
              ? BorderSide.none
              : const BorderSide(
                  color: Colors.grey,
                ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        margin: const EdgeInsets.only(
          right: padding10 / 2,
        ),
        color: selectedIndex == index ? Colors.white : Colors.white70,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            10,
          ),
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
                    model.operator,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.grey,
                        ),
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
