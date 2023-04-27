import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CodePostalFormField extends StatelessWidget {
  const CodePostalFormField({
    Key? key,
    required this.controller,
    this.onSaved,
    this.onEditComplete,
    this.labelText,
  }) : super(key: key);
  final TextEditingController controller;
  final Function(String? value)? onSaved;
  final Function()? onEditComplete;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autocorrect: false,
      controller: controller,
      onChanged: (value) {},
      onEditingComplete: onEditComplete,
      onSaved: onSaved,
      textInputAction: TextInputAction.done,
      inputFormatters: [
        LengthLimitingTextInputFormatter(4),
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: "xxxx",
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
