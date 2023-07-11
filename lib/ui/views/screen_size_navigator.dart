import 'package:flutter/material.dart';
import 'package:my_links/core/provider/user_provider.dart';
import 'package:my_links/core/services/storage_service.dart';
import 'package:my_links/ui/shared/shared_utils.dart';
import 'package:my_links/ui/views/mobile/auth_home_mobile.dart';
import 'package:my_links/ui/views/mobile/home_mobile.dart';
import 'package:my_links/ui/views/web/auth_home.dart';
import 'package:my_links/ui/views/web/home_page.dart';
import 'package:provider/provider.dart';

import '../../core/constants/constants.dart';

class ScreenSizeNavigator extends StatefulWidget {
  const ScreenSizeNavigator({Key? key}) : super(key: key);

  @override
  State<ScreenSizeNavigator> createState() => _ScreenSizeNavigatorState();
}

class _ScreenSizeNavigatorState extends State<ScreenSizeNavigator> {
  Map? userCredentials;

  fetchCredentials() async {
    userCredentials = await StorageService().getUserCredentials();

    if (userCredentials != null) {
      await Future.delayed(duration, () {
        context.read<UserProvider>().storeUserCredentials(userCredentials!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = SharedUtils().getSize(context);

    return FutureBuilder(
        future: fetchCredentials(),
        builder: (context, snapshot) {
          if (size.width > 800) {
            return userCredentials != null
                ? const HomePage()
                : const AuthHome();
          } else {
            return userCredentials != null
                ? const HomeMobile()
                : const AuthHomeMobile();
          }
        });
  }
}
