import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  final Gradient gradient;
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  const GradientText({
    Key? key,
    required this.gradient,
    required this.text,
    this.style,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style, textAlign: textAlign),
    );
  }
}
