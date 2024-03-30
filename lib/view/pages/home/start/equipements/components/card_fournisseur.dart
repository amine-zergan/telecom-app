import 'package:flutter/material.dart';

import '../../../../../../model/components/project/project_model.dart';

class CardFournisseur extends StatelessWidget {
  const CardFournisseur({
    super.key,
    required this.project,
    required this.selectedProject,
    required this.index,
    required this.onTap,
  });

  final Project project;
  final int? selectedProject;
  final int index;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: selectedProject == index ? Colors.grey.shade600 : Colors.black12,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(5),
      width: 100,
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.asset(
                project.image,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  project.name,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: selectedProject == index
                            ? Colors.black
                            : Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
