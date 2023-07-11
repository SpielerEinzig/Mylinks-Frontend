import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_links/core/provider/links_provider.dart';
import 'package:my_links/core/provider/user_provider.dart';
import 'package:provider/provider.dart';

import '../../shared/colors.dart';
import '../../shared/shared_utils.dart';
import '../../shared/text_styles.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/gradient_text.dart';
import '../../widgets/link_table_item.dart';
import '../../widgets/search_bar_text_field.dart';
import '../../widgets/show_snackbar.dart';
import '../../widgets/table_header_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _linkController = TextEditingController();
  final SharedUtils _utils = SharedUtils();

  fetchLinks() async {
    Map? userDetails = context.read<UserProvider>().getUserDetails;

    if (userDetails != null) {
      context.read<LinksProvider>().fetchAffiliatedLinks(userDetails['userId']);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLinks();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, child) {
      return Consumer<LinksProvider>(builder: (context, linkProvider, child) {
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: SearchBarTextField(
                          onTap: () async {
                            if (_linkController.text.isNotEmpty) {
                              await linkProvider.createLink(
                                  userId:
                                      userProvider.getUserDetails!['userId'],
                                  longUrl: _linkController.text,
                                  shortUrl: null);
                            }
                          },
                          hintText: "Enter the link here",
                          controller: _linkController,
                        ),
                      ),
                    ),
                    CustomButton(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 15),
                      borderColor: kBorderGreyColor,
                      color: kPrimaryColor,
                      borderRadius: 48,
                      onTap: () async {
                        if (_linkController.text.isNotEmpty) {}
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'Hello \n',
                              style: kTinyWhiteTextStyle,
                              children: <TextSpan>[
                                TextSpan(
                                    text: userProvider
                                        .getUserDetails!['username'],
                                    style: kButtonStyle),
                              ],
                            ),
                          ),
                          const SizedBox(width: 20),
                          const Icon(Icons.logout,
                              color: Colors.white, size: 20),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: linkProvider.getLinkList.isEmpty
                      ? const Center(
                          child: Text(
                          "You haven't shortened any link",
                          style: kTinyWhiteTextStyle,
                        ))
                      : Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  _utils.getSize(context).width * 0.088),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  height:
                                      _utils.getSize(context).height * 0.08),
                              Text(
                                  "History (${linkProvider.getLinkList.length})",
                                  style: kSubheadingTextStyle),
                              const SizedBox(height: 20),
                              Expanded(
                                child: Container(
                                  color: kPrimaryColor.withOpacity(0.6),
                                  child: SingleChildScrollView(
                                    child: Table(
                                      border:
                                          TableBorder.all(color: kPrimaryColor),
                                      columnWidths: const <int,
                                          TableColumnWidth>{
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
                                            TableHeaderText(
                                                text: "Original link"),
                                            TableHeaderText(text: "QR code"),
                                            TableHeaderText(text: "Clicks"),
                                            TableHeaderText(text: "Date"),
                                          ],
                                        ),
                                        ...linkProvider.getLinkList
                                            .map((linkModel) => linkTableItem(
                                                  linkModel: linkModel,
                                                  mobile: false,
                                                  onTap: () {
                                                    Clipboard.setData(
                                                        ClipboardData(
                                                            text: linkModel
                                                                .shorUrl));

                                                    showSnackBar(
                                                        context: context,
                                                        text: "Copied item");
                                                  },
                                                ))
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
      });
    });
  }
}
