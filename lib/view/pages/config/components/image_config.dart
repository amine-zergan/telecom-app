import 'dart:io';

import 'package:flutter/material.dart';
import 'package:telecom/view/theme/size_constants.dart';

class ConfigImage extends StatelessWidget {
  const ConfigImage({
    super.key,
    required this.press,
    this.file,
    required this.icon,
    this.error = "message d'erreur au cas ou ",
  });
  final VoidCallback press;
  final File? file;
  final IconData icon;
  final String error;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: size.height * 0.13,
          height: size.height * 0.13,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Card(
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                size.height * 0.1,
              ),
            ),
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                  radius: size.height * 0.075,
                  backgroundColor: const Color.fromARGB(72, 123, 123, 123),
                  child: file == null
                      ? Icon(
                          icon,
                          size: size.width * 0.1,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(
                            size.height * 0.1,
                          ),
                          child: Image.file(
                            file!,
                            fit: BoxFit.cover,
                            width: size.height * 0.13,
                            height: size.height * 0.13,
                          ),
                        ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: InkWell(
                    onTap: press,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(82, 13, 13, 13),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.image_search,
                          size: 25,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: padding10,
        ),
        Text(
          error,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Colors.red.shade600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
