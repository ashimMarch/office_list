import 'package:flutter/material.dart';
import 'package:flutter/services.dart'
    show TextInputFormatter;


class CustomTextField extends StatelessWidget {
  const CustomTextField({
    this.hintText,
    this.prefixText,
    this.prefixStyle,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.keyboardType,
    this.onChanged,
    this.inputFormatters,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.focusNode,
    this.onTap,
    this.onTapOutside,
    this.obscureText = false,
    super.key,
  });
  final String? hintText;
  final String? prefixText;
  final TextStyle? prefixStyle;
  final Widget? prefixIcon;

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final bool readOnly;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;

  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      onTap: onTap,
      onTapOutside: onTapOutside,
      readOnly: readOnly,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      style: const TextStyle(
          color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal,),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        prefixText: prefixText,
        prefixStyle: prefixStyle ??
            const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
        prefixIcon: prefixIcon,
        fillColor: Colors.grey.shade200,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
          // borderSide: BorderSide(width: 1.5,color: Colors.grey.shade200)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 1.5, color: Colors.grey.shade200),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide.none,
          // borderSide: BorderSide(width: 1.5,color: Color(0xFFCACACA)),
        ),
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
      ),
    );
  }
}
