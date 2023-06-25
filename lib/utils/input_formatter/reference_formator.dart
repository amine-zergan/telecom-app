import 'package:flutter/services.dart';

/// reformat code not work !!!!!!
class ReferenceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;
      if (inputData[0] != "0" && inputData.length != index) {
        buffer.write("0");
      }
      if (index == 0 && inputData.length != index && inputData[0] != "0") {
        buffer.write("0");
      }
      if (index == 1 && inputData.length != index && inputData[1] != "0") {
        buffer.write("0");
      }
      if (index == 2 && inputData.length != index && inputData[2] != "0") {
        buffer.write("0");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
