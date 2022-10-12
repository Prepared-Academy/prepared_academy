import 'package:flutter/material.dart';

InputDecoration inputDecoration(
    {bool? showpassword,
    String? prefixImageIcon,
    Widget? widget,
    String? hintText,
    String? labelText}) {
  return InputDecoration(
    // enabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   borderSide: const BorderSide(color: Color(0xFF707070)),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   borderSide: const BorderSide(color: Color(0xFF707070)),
    // ),
    // errorBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   borderSide: BorderSide(color: Colors.red.shade600, width: 1),
    // ),
    // disabledBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   borderSide: const BorderSide(color: Color(0xFF707070)),
    // ),
    // focusedErrorBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(5),
    //   borderSide: BorderSide(color: Colors.red.shade600, width: 2),
    // ),

    // hintStyle: const TextStyle(
    //   color: Colors.grey,
    //   fontWeight: FontWeight.normal,
    // ),
    prefixIcon: prefixImageIcon == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Image.asset(prefixImageIcon)),
    prefixIconConstraints: prefixImageIcon == null
        ? null
        : const BoxConstraints(minWidth: 20, maxHeight: 20),
    counterText: "",
    suffixIcon: widget,
    hintText: hintText,
    labelText: labelText,
  );
}
