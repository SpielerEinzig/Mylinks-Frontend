import 'package:flutter/material.dart';
import 'package:my_links/ui/shared/colors.dart';

import '../shared/text_styles.dart';

class TableHeaderText extends StatelessWidget {
  final String text;
  const TableHeaderText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Text(
            text,
            style: kTableHeaderTextStyle,
          ),
        ),
      ),
    );
  }
}
