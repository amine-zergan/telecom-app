// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:telecom/validators/site/coordonnee_validator.dart';

import '../../../utils/input_formatter/longitude_formater.dart';

class LongitudeFormField extends StatelessWidget {
  const LongitudeFormField({
    Key? key,
    required this.controller,
    this.focusNode,
    this.onEditCompleted,
  }) : super(key: key);
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function()? onEditCompleted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
        CoordonationLongitude(),
      ],
      autocorrect: false,
      controller: controller,
      focusNode: focusNode,
      onEditingComplete: onEditCompleted,
      keyboardType: TextInputType.name,
      validator: ValidatorCoordonnee.longitudevalidator,
      decoration: const InputDecoration(
        hintText: "9.23333333",
        labelText: "Longitude de site",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(),
        focusedErrorBorder: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(),
      ),
    );
  }
}
