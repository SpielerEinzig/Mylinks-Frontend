import 'package:flutter/material.dart';
import 'package:my_links/core/provider/user_provider.dart';
import 'package:my_links/ui/shared/colors.dart';
import 'package:my_links/ui/shared/shared_utils.dart';
import 'package:my_links/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/constants.dart';
import '../custom_button.dart';
import '../custom_textfield.dart';

class LogInDialog extends StatefulWidget {
  const LogInDialog({Key? key}) : super(key: key);

  @override
  State<LogInDialog> createState() => _LogInDialogState();
}

class _LogInDialogState extends State<LogInDialog> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final SharedUtils _utils = SharedUtils();
  String? showError;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return AlertDialog(
          backgroundColor: kPrimaryColor,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
                child: Column(
                  children: [
                    const Text("Login to your account",
                        style: kSubheadingTextStyle),
                    SizedBox(height: _utils.getSize(context).height * 0.025),
                    CustomTextField(
                      controller: _emailController,
                      hintText: "Enter your email",
                      obscureText: false,
                      textInputType: TextInputType.text,
                      suffixWidget: null,
                      label: "Email",
                    ),
                    SizedBox(height: _utils.getSize(context).height * 0.02),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: "Enter your password",
                      obscureText: true,
                      textInputType: TextInputType.text,
                      suffixWidget: null,
                      label: "Password",
                    ),
                    SizedBox(height: _utils.getSize(context).height * 0.02),
                    if (showError != null)
                      Text(
                        showError ?? "An error occurred",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    const SizedBox(height: 15),
                    CustomButton(
                      borderColor: Colors.white,
                      color: kBlueGradientColor,
                      borderRadius: 20,
                      onTap: () async {
                        showError = null;

                        final status = await userProvider.login(
                            email: _emailController.text,
                            password: _passwordController.text);

                        if (status == 'success') {
                          await Future.delayed(duration, () {
                            Navigator.pop(context, status);
                          });
                        } else {
                          setState(() {
                            showError = status;
                          });
                        }
                      },
                      padding: EdgeInsets.symmetric(
                        horizontal: _utils.getSize(context).width * 0.08,
                        vertical: 20,
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: kButtonStyle,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
