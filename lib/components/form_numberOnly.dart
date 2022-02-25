import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

TextFormField FormNumber(_controller, _label, {length = 13}) {
  return TextFormField(
    controller: _controller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Este campo não pode estar em branco';
      }
      return null;
    },
    inputFormatters: [FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(length)],
    keyboardType: TextInputType.number,
    scrollPadding: EdgeInsets.zero,
    decoration: InputDecoration(
      labelText: _label,
      fillColor: Colors.white,
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.always,
    ),
  );
}

InternationalPhoneNumberInput FormPhoneNumber(_controller, _label) {
  final TextEditingController controller = TextEditingController();
  String initialCountry = 'UK';
  PhoneNumber number = PhoneNumber(isoCode: 'UK');

  return InternationalPhoneNumberInput(
    onInputChanged: (PhoneNumber number) {
    },
    selectorConfig: const SelectorConfig(
      selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
    ),
    ignoreBlank: false,
    autoValidateMode: AutovalidateMode.disabled,
    selectorTextStyle: TextStyle(color: Colors.black),
    initialValue: number,
    textFieldController: controller,
    formatInput: false,
    keyboardType: TextInputType.numberWithOptions(signed: true, decimal: true),
    inputBorder: OutlineInputBorder(),
    onSaved: (PhoneNumber number) {
      print('On Saved: $number');
    },
  );
}
