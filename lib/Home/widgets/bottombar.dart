import 'package:flutter/material.dart';

BottomAppBar BottomBar(_controller, _label) {
  return BottomAppBar(
    color: Colors.purple,
    child: Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 32, left: 32),
      child: Form(
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
              color: Colors.black,
            ),
            fillColor: Colors.white,
            filled: true,
            hintText: _label,
            labelStyle: const TextStyle(
              color: Colors.black,
            ),
            border: OutlineInputBorder(
              //borderSide: const BorderSide(color: Colors.white, width: 2.0),
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
      ),
    ),
  );
}
