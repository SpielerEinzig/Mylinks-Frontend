import 'package:flutter/material.dart';

import '../../../core/constants/constants.dart';
import '../../shared/colors.dart';
import '../../shared/shared_utils.dart';
import '../../shared/text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/gradient_text.dart';
import '../../widgets/link_table_item.dart';
import '../../widgets/search_bar_text_field.dart';
import '../../widgets/table_header_text.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final TextEditingController _linkController = TextEditingController();
  final SharedUtils _utils = SharedUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/main.png"),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GradientText(
                  text: "Mylinks",
                  style: kAppNameStyle,
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [kRedGradientColor, kBlueGradientColor],
                  ),
                ),
                CustomButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  borderColor: kBorderGreyColor,
                  color: kPrimaryColor,
                  borderRadius: 48,
                  onTap: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: 'Hello \n',
                          style: kTinyWhiteTextStyle,
                          children: <TextSpan>[
                            TextSpan(text: 'Gloria', style: kButtonStyle),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.logout, color: Colors.white, size: 20),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: _utils.getSize(context).height * 0.03),
                  const GradientText(
                    text: "Shorten Your Loooong Links :)",
                    textAlign: TextAlign.center,
                    style: kHeadingStyle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [kRedGradientColor, kBlueGradientColor],
                    ),
                  ),
                  const SizedBox(height: 20),
                  SearchBarTextField(
                      hintText: "Enter the link here",
                      controller: _linkController,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                  const SizedBox(height: 20),
                  const Text("Enjoy unlimited usage",
                      textAlign: TextAlign.center, style: kTinyGreyTextStyle),
                  const SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      color: kPrimaryColor.withOpacity(0.6),
                      child: SingleChildScrollView(
                        child: Table(
                          border: TableBorder.all(color: kPrimaryColor),
                          columnWidths: const <int, TableColumnWidth>{
                            0: FlexColumnWidth(55),
                            1: FlexColumnWidth(60),
                            2: FixedColumnWidth(100),
                          },
                          defaultVerticalAlignment:
                              TableCellVerticalAlignment.middle,
                          children: <TableRow>[
                            const TableRow(
                              children: <Widget>[
                                TableHeaderText(text: "Short link"),
                                TableHeaderText(text: "Original link"),
                                TableHeaderText(text: "Clicks"),
                              ],
                            ),
                            ...linkModels
                                .map((linkModel) => linkTableItem(
                                    linkModel: linkModel, mobile: true))
                                .toList(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
