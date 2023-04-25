import 'package:flutter/material.dart';

class Buble extends StatelessWidget {
  const Buble({
    Key? key,
    required this.selectIndex,
    required this.index,
  }) : super(key: key);

  final int selectIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: 10,
      height: 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: selectIndex == index
            ? Colors.white
            : const Color.fromARGB(204, 68, 62, 164),
        shape: BoxShape.circle,
        border: Border.all(),
      ),
    );
  }
}
