import 'package:flutter/material.dart';
import 'package:my_links/ui/views/mobile/home_mobile.dart';
import 'package:my_links/ui/widgets/search_bar_text_field.dart';

import '../../../core/constants/constants.dart';
import '../../shared/colors.dart';
import '../../shared/page_navigation.dart';
import '../../shared/shared_utils.dart';
import '../../shared/text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/dialogs/log_in_dialog.dart';
import '../../widgets/dialogs/sign_up_dialog.dart';
import '../../widgets/gradient_text.dart';
import '../../widgets/link_table_item.dart';
import '../../widgets/table_header_text.dart';

class AuthHomeMobile extends StatefulWidget {
  const AuthHomeMobile({Key? key}) : super(key: key);

  @override
  State<AuthHomeMobile> createState() => _AuthHomeMobileState();
}

class _AuthHomeMobileState extends State<AuthHomeMobile> {
  final TextEditingController _linkController = TextEditingController();
  final PageNavigation _navigation = PageNavigation();
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
                            _navigation.replacePage(
                                context: context, page: const HomeMobile());
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
                  ],
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
                  const Text(
                      "Linkly is an efficient and easy-to-use"
                      " URL shortening service that streamlines"
                      " your \nonline experience.",
                      textAlign: TextAlign.center,
                      style: kTinyGreyTextStyle),
                  const SizedBox(height: 20),
                  SearchBarTextField(
                      hintText: "Enter the link here",
                      controller: _linkController,
                      onTap: () async {
                        String? status = await showDialog(
                            context: context,
                            builder: (context) {
                              return const LogInDialog();
                            });

                        if (status != null && status == 'success') {
                          await Future.delayed(duration, () {
                            _navigation.replacePage(
                                context: context, page: const HomeMobile());
                          });
                        }
                      },
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
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
                                    linkModel: linkModel,
                                    mobile: true,
                                    context: context))
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
      bottomNavigationBar: Container(
        height: 50,
        color: kPrimaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  String? status = await showDialog(
                      context: context,
                      builder: (context) {
                        return const SignUpDialog();
                      });

                  if (status != null && status == 'success') {
                    await Future.delayed(duration, () {
                      _navigation.pushPage(
                          context: context, page: const HomeMobile());
                    });
                  }
                },
                child: const Text("Register now")),
            const Text("To enjoy unlimited usage", style: kTinyGreyTextStyle),
          ],
        ),
      ),
    );
  }
}
