// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DescriptionFormField extends StatelessWidget {
  const DescriptionFormField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.onEditComplete,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function()? onEditComplete;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 5,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditComplete,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
    );
  }
}
