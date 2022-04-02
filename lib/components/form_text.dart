import 'package:flutter/material.dart';

class FormText extends StatelessWidget{
  final TextEditingController controller;
  final String label;

  const FormText(this.controller, this.label, {Key? key}) : super(key: key);

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

