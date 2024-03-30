import 'package:flutter/material.dart';
import 'package:telecom/view/components/Form_Fields/Longitude_form_field.dart';
import 'package:telecom/view/components/Form_Fields/latitude_form_field.dart';
import 'package:telecom/view/pages/home/views/navigation/controllers/navigation_Controller.dart';
import 'package:telecom/view/theme/color_constants.dart';
import 'package:telecom/view/theme/size_constants.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({
    super.key,
    required this.controller,
  });
  final NavigationController controller;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Form(
        key: controller.form,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Choisi Votre destination",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 2 * padding10,
            ),
            LatitudeFormField(
              controller: controller.fieldLatitude,
            ),
            const SizedBox(
              height: padding10,
            ),
            LongitudeFormField(
              controller: controller.fieldLongitude,
            ),
            const SizedBox(
              height: padding10,
            ),
            Center(
              child: MaterialButton(
                onPressed: controller.navigateTosite,
                elevation: 0,
                color: colorButton.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: padding10 * 0.75,
                ),
                minWidth: size.width * 0.5,
                child: Text(
                  "commencer",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
