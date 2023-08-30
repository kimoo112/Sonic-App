import 'package:flutter/material.dart';
import '../../Helpers/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final AutovalidateMode autovalidateMode;
  final Widget suffixIc;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.autovalidateMode,
    required this.isPassword,
    required this.suffixIc,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: widget.autovalidateMode,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your ${widget.labelText}';
          }
          return null;
        },
        obscureText: widget.isPassword,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIc,
          labelText: widget.labelText,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: cBackGround,width: 2)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: cIndicator)),
        ),
      ),
    );
  }
}
