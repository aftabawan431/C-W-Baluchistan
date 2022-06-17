import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/router/models/page_action.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/enums/page_state_enum.dart';

class AuthProvider extends ChangeNotifier {
  ValueNotifier<bool> obsecureTextNotifier = ValueNotifier(true);
  ValueNotifier<bool> obsecurePasswordTextNotifier = ValueNotifier(true);
  ValueNotifier<bool> obsecureConfirmPasswordTextNotifier = ValueNotifier(true);

  bool isButtonPressed = false;
  bool isPasswordButtonPressed = false;
  bool isConfirmPasswordButtonPressed = false;
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isForgetPasswordError = false;
  bool isConfirmPasswordError = false;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetEmailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> forgetConfirmFormKey = GlobalKey<FormState>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode forgetEmailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode forgotPasswordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  // Methods
  void onEmailSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordFocusNode);
  }

  void onPasswordSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void onObsecureChange() {
    obsecureTextNotifier.value = !obsecureTextNotifier.value;
  }

  void onObsecurePasswordChange() {
    obsecurePasswordTextNotifier.value = !obsecurePasswordTextNotifier.value;
  }

  void onObsecureConfirmPasswordChange() {
    obsecureConfirmPasswordTextNotifier.value = !obsecureConfirmPasswordTextNotifier.value;
  }

  void onEmailChange(String value) {
    isButtonPressed = false;
    if (isEmailError) {
      loginFormKey.currentState!.validate();
    }
  }

  void onPasswordChange(String value) {
    isButtonPressed = false;
    if (isPasswordError) {
      loginFormKey.currentState!.validate();
    }
  }

  void onForgetPasswordChange(String value) {
    isPasswordButtonPressed = false;
    if (isForgetPasswordError) {
      forgetConfirmFormKey.currentState!.validate();
    }
  }

  void onConfirmPasswordChange(String value) {
    isConfirmPasswordButtonPressed = false;
    if (isConfirmPasswordError) {
      forgetConfirmFormKey.currentState!.validate();
    }
  }

  AppState appState = GetIt.I.get<AppState>();

  void moveToForgetPasswordEmail() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.forgetPasswordEmailPageConfig);
  }

  void moveToForgetPasswordConfirm() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.forgetConfirmPasswordPageConfig);
  }

  void moveToLogin() {
    appState.currentAction = PageAction(state: PageState.replaceAll, page: PageConfigs.loginPageConfig);
  }

  void moveToDashboard() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.dashBoardMainScreenPageConfig);
  }

  void removeToDashboard() {
    appState.currentAction = PageAction(state: PageState.replaceAll, page: PageConfigs.dashBoardMainScreenPageConfig);
  }
}
