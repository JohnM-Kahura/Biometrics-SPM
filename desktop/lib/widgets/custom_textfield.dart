import 'package:flutter/material.dart';

Widget customTextFeild(double height, double width, String hint,
    TextEditingController controller, TextInputType inputType) {
  return Container(
    height: height,
    width: width,
    margin: const EdgeInsets.all(4),
    child: TextField(
      controller: controller,
      // autofocus: true,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 15),
        fillColor: Colors.white,
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusColor: Colors.white,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
      ),
      // cursorColor: Colors.blueGrey,
    ),
  );
}
