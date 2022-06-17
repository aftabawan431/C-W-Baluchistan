import 'dart:async';

import 'package:cw_blochistan/core/router/app_state.dart';
import 'package:cw_blochistan/core/router/models/page_action.dart';
import 'package:cw_blochistan/core/router/models/page_config.dart';
import 'package:cw_blochistan/core/utils/enums/page_state_enum.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({Key? key}) : super(key: key);

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent> {
  AppState appState = GetIt.I.get<AppState>();

  @override
  void initState() {
    super.initState();
    goToScreen();
  }

  goToScreen() {
    Timer(const Duration(milliseconds: 1600), () {
      appState.currentAction = PageAction(state: PageState.replace, page: PageConfigs.loginPageConfig);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Image.asset(
              'assets/images/splash2.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
