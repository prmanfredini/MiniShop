import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormNumber extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final int length;

  const FormNumber(this.controller, this.label, {Key? key, this.length = 13})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Não pode estar em branco';
        }
        return null;
      },
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(length)
      ],
      keyboardType: TextInputType.number,
      scrollPadding: EdgeInsets.zero,
      decoration: InputDecoration(
        errorMaxLines: 2,
        labelText: label,
        fillColor: Colors.white,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}