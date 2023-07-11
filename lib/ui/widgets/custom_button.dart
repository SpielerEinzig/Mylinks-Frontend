import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Color color;
  final double borderRadius;
  final Function() onTap;
  const CustomButton({
    Key? key,
    required this.child,
    required this.padding,
    required this.borderColor,
    required this.color,
    required this.borderRadius,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          loading = true;
        });

        await widget.onTap();

        setState(() {
          loading = false;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(widget.color),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          widget.padding,
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            side: BorderSide(color: widget.borderColor),
          ),
        ),
      ),
      child: loading
          ? const CircularProgressIndicator(color: Colors.white)
          : widget.child,
    );
  }
}
