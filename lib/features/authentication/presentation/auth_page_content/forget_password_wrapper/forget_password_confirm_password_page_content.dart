import 'package:cw_blochistan/core/constants/app_assets.dart';
import 'package:cw_blochistan/core/constants/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/form_validator.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';
import '../../auth_provider/authentication_Provider.dart';

class ForgetConfirmPasswordScreen extends StatelessWidget {
  ForgetConfirmPasswordScreen({Key? key}) : super(key: key);

  AuthProvider _authProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _authProvider, child: ForgetConfirmPasswordScreenContent());
  }
}

class ForgetConfirmPasswordScreenContent extends StatelessWidget {
  ForgetConfirmPasswordScreenContent({Key? key}) : super(key: key);

  final passwordController = TextEditingController();
  final forgotpasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackgroundColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                SvgPicture.asset(AppAssets.icAppLogoSvg),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'C&W Baluchistan',
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: const Color(0xFF2A9488), fontSize: 30.h),
                ),
                Text(
                  'Reset Password',
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: const Color(0xFF2A9488), fontSize: 30.h),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFF7F8FA), //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                        bottomLeft: Radius.circular(40.0),
                      )),
                  height: 350.h,
                  child: Form(
                    key: context.read<AuthProvider>().forgetConfirmFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Text(
                          '  Password',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: context.read<AuthProvider>().obsecurePasswordTextNotifier,
                          builder: (_, obsecureText, __) {
                            return CustomTextFormField(
                              controller: passwordController,
                              hintText: 'Enter Password',
                              labelText: '',
                              obscureText: obsecureText,
                              suffixIconPath: obsecureText ? AppAssets.icPasswordSvg : AppAssets.icEyeOpenSvg,
                              suffixIconOnTap: context.read<AuthProvider>().onObsecurePasswordChange,
                              maxLines: 1,
                              validator: FormValidators.validateLoginPassword,
                              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              onFieldSubmitted: (_) => context.read<AuthProvider>().onPasswordSubmitted(context),
                              // onChanged: context.read<AuthProvider>().onForgetPasswordChange,
                              focusNode: context.read<AuthProvider>().forgotPasswordFocusNode,
                            );
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        const Text(
                          '  Change Password',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: context.read<AuthProvider>().obsecureConfirmPasswordTextNotifier,
                          builder: (_, obsecureText, __) {
                            return CustomTextFormField(
                              controller: confirmPasswordController,
                              hintText: 'Confirm Password',
                              labelText: '',
                              obscureText: obsecureText,
                              suffixIconPath: obsecureText ? AppAssets.icPasswordSvg : AppAssets.icEyeOpenSvg,
                              suffixIconOnTap: context.read<AuthProvider>().onObsecureConfirmPasswordChange,
                              maxLines: 1,
                              validator: FormValidators.validateLoginPassword,
                              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              onFieldSubmitted: (_) => context.read<AuthProvider>().onPasswordSubmitted(context),
                              onChanged: context.read<AuthProvider>().onConfirmPasswordChange,
                              focusNode: context.read<AuthProvider>().confirmPasswordFocusNode,
                            );
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        ContinueButton(
                            // loadingNotifier: context.read<LoginProvider>().loginLoading,
                            text: 'Update',
                            backgroundColor: AppTheme.appTheme.primaryColor,
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              _updatedPasswordDialog(context);
                              // if (_key.currentState!.validate()) {
                              //   context
                              //       .read<AuthProvider>()
                              //       .loginUser(LoginRequestModel(email: emailController.text.toLowerCase().trim(), password: passwordController.text, fcmtoken: token!));
                              // }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _updatedPasswordDialog(BuildContext context) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 110.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Password Updated Successfully',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: ContinueButton(
                      // loadingNotifier: context.read<LoginProvider>().loginLoading,
                      text: 'Yes',
                      backgroundColor: AppTheme.appTheme.primaryColor,
                      onPressed: () async {
                        AuthProvider authProvider = sl();
                        authProvider.moveToLogin();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  // TextButton(
                  //   child: const Text('Yes'),
                  //   onPressed: () async {
                  //     AuthProvider authProvider = sl();
                  //     authProvider.moveToLogin();
                  //     // context.read<AuthProvider>().moveToLogin();
                  //     Navigator.of(context).pop();
                  //   },
                  // ),
                ],
              ),
            ),
          );
        });
  }

// goToNext() {
//   AppState appState = GetIt.I.get<AppState>();
//   appState.currentAction = PageAction(
//       // state: PageState.addPage, page: PageConfigs.securityQuestionPageConfig);
// }
}
