import 'package:flutter/material.dart';

class CardMission extends StatelessWidget {
  const CardMission({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
    required this.color,
  });
  final String value;
  final String title;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.black),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: Icon(
              icon,
              size: 50,
              color: const Color.fromARGB(209, 59, 91, 150),
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                ),
          )
        ],
      ),
    );
  }
}
