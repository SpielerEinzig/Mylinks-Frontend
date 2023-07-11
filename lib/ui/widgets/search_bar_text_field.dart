import 'package:flutter/material.dart';
import 'package:my_links/ui/shared/colors.dart';

import '../shared/text_styles.dart';
import 'custom_button.dart';

class SearchBarTextField extends StatelessWidget {
  final Color? color;
  final Color? iconColor;
  final Widget? child;
  final String hintText;
  final VoidCallback onTap;
  final TextEditingController controller;
  const SearchBarTextField({
    Key? key,
    this.color,
    this.child,
    this.iconColor,
    required this.onTap,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: kBorderGreyColor, width: 1.5),
        color: kPrimaryColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.link_sharp, color: kGreyTextColor, size: 25),
          const SizedBox(width: 20),
          Expanded(
            flex: 10,
            child: Center(
              child: TextField(
                controller: controller,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: CustomButton(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 21),
              borderColor: kBorderGreyColor,
              color: kBlueGradientColor,
              borderRadius: 48,
              onTap: onTap,
              child: child ?? const Text("Shorten Now", style: kButtonStyle),
            ),
          ),
        ],
      ),
    );
  }
}
