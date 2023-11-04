
import 'package:flutter/material.dart';

class TextFielWidget extends StatelessWidget {
  final bool readOnly;
  // final String title;
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final Widget visibility;
  final String? Function(String?)? validator;
  final String? prefixText;
  final double? width;
  final TextInputType keyboardType;
  final String Function(String) onChanged;
  final FocusNode? node;
  final bool? filled;
  final AutovalidateMode autovalidateMode;
  final void Function(String)? onFieldSubmitted;
  final bool autofocus;
  int line;
  bool? isRequired = false;
  TextFielWidget({
  super.key,
  this.line=1,
  required this.readOnly,
  required this.controller,
  required this.hintText,
  required this.obsecureText,
  required this.visibility,
  required this.validator,
  this.prefixText,
  required this.keyboardType,
  required this.onChanged,
  this.node,
  this.onFieldSubmitted,
  required this.autofocus,
  this.isRequired,
  this.width, required,
  this.autovalidateMode = AutovalidateMode.onUserInteraction, this.filled,

});

@override
Widget build(BuildContext context) {
  return TextFormField(
    focusNode: node,
    autofocus: autofocus,
    readOnly: readOnly,
    keyboardType: keyboardType,
    onChanged: onChanged,
    autovalidateMode: autovalidateMode,
    maxLines: line,
    cursorColor: Colors.black,
    validator: validator,
    obscureText: obsecureText,
    controller: controller,
    decoration: InputDecoration(
      suffixIcon: visibility,
      prefixText: prefixText,
      filled: filled,
      fillColor: Colors.white,
      hintText: hintText,
      hintStyle:  TextStyle(
          fontSize: 20,
          color:Colors.grey.shade600,
          fontWeight: FontWeight.normal),
      errorStyle:  const TextStyle(
          fontSize: 20,
          color:Colors.redAccent,
          fontWeight: FontWeight.normal),
      border:  OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color:  Colors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder:   OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color:  Colors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedBorder:   OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color:Colors.red),
        borderRadius: BorderRadius.circular(20),
      ),
      errorBorder:   OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Colors.redAccent,),
        borderRadius: BorderRadius.circular(20),
      ),
      focusedErrorBorder:  OutlineInputBorder(
        borderSide: const BorderSide(
          width: 2,
          color: Colors.redAccent,),
        borderRadius: BorderRadius.circular(20),
      ),
      contentPadding: const EdgeInsets.only(
          top: 25, left: 25),
    ),
    onFieldSubmitted: onFieldSubmitted,
  );
}
}
