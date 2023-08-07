import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  final int lineCount;
  final bool isSuffix;

  CustomTextField(
      {super.key, this.controller, this.lineCount = 1, this.isSuffix = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: lineCount,
      minLines: lineCount,
      decoration: InputDecoration(
        suffixIcon: isSuffix ? const Icon(Icons.location_on_rounded) : null,
        suffixIconColor: isSuffix ? Colors.blue : null,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
