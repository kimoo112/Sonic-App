
  import 'package:flutter/material.dart';
import '../../Helpers/colors.dart';

Widget textField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your $label';
          }
          return null;
        },
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: cLightGrey),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cBlue, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: cDark, width: 1.0),
          ),
        ),
      ),
    );
  }