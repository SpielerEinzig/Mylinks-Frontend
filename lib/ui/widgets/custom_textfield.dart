import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String label;
  final Color? color;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType textInputType;
  final Widget? suffixWidget;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.inputFormatters,
    this.color,
    this.maxLength,
    required this.label,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.textInputType,
    required this.suffixWidget,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    Color kPrimary = widget.color == null
        ? Colors.white.withOpacity(0.8)
        : widget.color!.withOpacity(0.8);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 18,
            color: kPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          maxLength: widget.maxLength,
          inputFormatters: widget.inputFormatters,
          controller: widget.controller,
          keyboardType: widget.textInputType,
          obscureText: widget.obscureText,
          style: TextStyle(color: kPrimary.withOpacity(0.8)),
          decoration: InputDecoration(
            counterText: "",
            hintText: widget.hintText,
            hintStyle: TextStyle(color: kPrimary.withOpacity(0.7)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1.2,
                color: kPrimary,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 1.2,
                color: kPrimary,
              ),
            ),
            suffix: widget.suffixWidget,
          ),
        ),
      ],
    );
  }
}
