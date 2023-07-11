import 'package:flutter/material.dart';
import 'package:my_links/ui/shared/colors.dart';

showSnackBar({
  required BuildContext context,
  required String text,
  Color? backgroundColor,
  Color? textColor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor ?? kBlueGradientColor,
      content: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.white),
      ),
    ),
  );
}
