import 'package:flutter/material.dart';
import 'package:my_links/ui/shared/colors.dart';
import 'package:my_links/ui/shared/page_navigation.dart';
import 'package:my_links/ui/shared/shared_utils.dart';
import 'package:my_links/ui/shared/text_styles.dart';
import 'package:my_links/ui/views/web/home_page.dart';
import 'package:my_links/ui/widgets/custom_button.dart';
import 'package:my_links/ui/widgets/dialogs/log_in_dialog.dart';
import 'package:my_links/ui/widgets/dialogs/sign_up_dialog.dart';
import 'package:my_links/ui/widgets/gradient_text.dart';
import 'package:my_links/ui/widgets/link_table_item.dart';
import 'package:my_links/ui/widgets/table_header_text.dart';

import '../../../core/constants/constants.dart';
import '../../widgets/search_bar_text_field.dart';

class AuthHome extends StatefulWidget {
  const AuthHome({Key? key}) : super(key: key);

  @override
  State<AuthHome> createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  final TextEditingController _linkController = TextEditingController();
  final PageNavigation _navigation = PageNavigation();
  final SharedUtils _utils = SharedUtils();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.only(left: 55, right: 55, top: 40),
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
                Row(
                  children: [
                    CustomButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 21),
                      borderColor: kBorderGreyColor,
                      color: kPrimaryColor,
                      borderRadius: 48,
                      onTap: () async {
                        String? status = await showDialog(
                            context: context,
                            builder: (context) {
                              return const LogInDialog();
                            });

                        if (status != null && status == 'success') {
                          await Future.delayed(duration, () {
                            _navigation.pushPage(
                                context: context, page: const HomePage());
                          });
                        }
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Login", style: kButtonStyle),
                          SizedBox(width: 10),
                          Icon(Icons.logout, color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    CustomButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 21),
                      borderColor: kBorderGreyColor,
                      color: kBlueGradientColor,
                      borderRadius: 48,
                      onTap: () async {
                        String? status = await showDialog(
                            context: context,
                            builder: (context) {
                              return const SignUpDialog();
                            });

                        if (status != null && status == 'success') {
                          await Future.delayed(duration, () {
                            _navigation.pushPage(
                                context: context, page: const HomePage());
                          });
                        }
                      },
                      child: const Text("Register Now", style: kButtonStyle),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: _utils.getSize(context).width * 0.088),
                child: Column(
                  children: [
                    SizedBox(height: _utils.getSize(context).height * 0.08),
                    const GradientText(
                      text: "Shorten Your Loooong Links :)",
                      style: kHeadingStyle,
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [kRedGradientColor, kBlueGradientColor],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                        "Linkly is an efficient and easy-to-use"
                        " URL shortening service that streamlines"
                        " your \nonline experience.",
                        textAlign: TextAlign.center,
                        style: kTinyGreyTextStyle),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: SearchBarTextField(
                        hintText: "Enter the link here",
                        controller: _linkController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("Register now to enjoy unlimited usage",
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
                              3: FixedColumnWidth(100),
                              4: FixedColumnWidth(150),
                            },
                            defaultVerticalAlignment:
                                TableCellVerticalAlignment.middle,
                            children: <TableRow>[
                              const TableRow(
                                children: <Widget>[
                                  TableHeaderText(text: "Short link"),
                                  TableHeaderText(text: "Original link"),
                                  TableHeaderText(text: "QR code"),
                                  TableHeaderText(text: "Clicks"),
                                  TableHeaderText(text: "Date"),
                                ],
                              ),
                              ...linkModels
                                  .map((linkModel) => linkTableItem(
                                      linkModel: linkModel, mobile: false))
                                  .toList(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
