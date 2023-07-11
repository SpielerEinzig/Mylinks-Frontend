import 'package:flutter/material.dart';

import '../../core/models/link_model.dart';
import '../shared/text_styles.dart';

TableRow linkTableItem(
    {required LinkModel linkModel,
    required bool mobile,
    required VoidCallback onTap}) {
  if (mobile) {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    linkModel.longUrl,
                    overflow: TextOverflow.ellipsis,
                    style: kTinyGreyTextStyle,
                  ),
                ),
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            linkModel.shorUrl,
            overflow: TextOverflow.ellipsis,
            style: kTinyGreyTextStyle,
          ),
        ),
        Center(
          child: Text(
            linkModel.clickCount.toString(),
            overflow: TextOverflow.ellipsis,
            style: kTinyGreyTextStyle,
          ),
        ),
      ],
    );
  } else {
    return TableRow(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(
                    linkModel.longUrl,
                    overflow: TextOverflow.ellipsis,
                    style: kTinyGreyTextStyle,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.copy),
                ),
              ],
            ),
          ),
        ),
        Center(
          child: Text(
            linkModel.shorUrl,
            overflow: TextOverflow.ellipsis,
            style: kTinyGreyTextStyle,
          ),
        ),
        Center(
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.qr_code, size: 35),
          ),
        ),
        Center(
          child: Text(
            linkModel.clickCount.toString(),
            overflow: TextOverflow.ellipsis,
            style: kTinyGreyTextStyle,
          ),
        ),
        Center(
          child: Text(
            "${linkModel.created.day} -"
            " ${linkModel.created.month} -"
            " ${linkModel.created.year}",
            overflow: TextOverflow.ellipsis,
            style: kTinyGreyTextStyle,
          ),
        ),
      ],
    );
  }
}
