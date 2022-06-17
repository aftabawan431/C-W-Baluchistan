import 'package:cw_blochistan/core/constants/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/utils/globals/globals.dart';
import '../../../../../core/utils/validators/form_validator.dart';
import '../../../../../core/widgets/custom/continue_button.dart';
import '../../../../../core/widgets/custom/custom_form_field.dart';
import '../../auth_provider/authentication_Provider.dart';

class ForgetEnterEmailScreen extends StatelessWidget {
  ForgetEnterEmailScreen({Key? key}) : super(key: key);

  AuthProvider _authProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _authProvider, child: ForgetEnterEmailScreenContent());
  }
}

class ForgetEnterEmailScreenContent extends StatelessWidget {
  ForgetEnterEmailScreenContent({Key? key}) : super(key: key);

  final forgetPasswordEmailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackgroundColor,
      // resizeToAvoidBottomInset: false,
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
                  'Forget Password',
                  style: Theme.of(context).textTheme.headline6?.copyWith(color: const Color(0xFF2A9488), fontSize: 30.h),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Color(0xFFF7F8FA), //new Color.fromRGBO(255, 0, 0, 0.0),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      )),
                  height: 200.h,
                  child: Form(
                    key: context.read<AuthProvider>().forgetEmailFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Text(
                          '  Email',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          maxLines: 1,
                          controller: forgetPasswordEmailController,
                          hintText: 'Enter Email',
                          labelText: '',
                          validator: FormValidators.validateEmail,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          focusNode: context.read<AuthProvider>().forgetEmailFocusNode,
                          onChanged: context.read<AuthProvider>().onEmailChange,
                          onFieldSubmitted: (_) => context.read<AuthProvider>().onEmailSubmitted(context),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ContinueButton(
                            // loadingNotifier: context.read<LoginProvider>().loginLoading,
                            text: 'Send',
                            backgroundColor: AppTheme.appTheme.primaryColor,
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<AuthProvider>().moveToForgetPasswordConfirm();
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

                // ContinueButton(
                //     loadingNotifier: context.read<LoginProvider>().loginLoading,
                //     text: 'Login'.tr(),
                //     onPressed: () async {
                //       FocusManager.instance.primaryFocus?.unfocus();
                //       final token = await PushNotifcationService().getToken();
                //       if (_key.currentState!.validate()) {
                //         context
                //             .read<LoginProvider>()
                //             .loginUser(LoginRequestModel(email: emailController.text.toLowerCase().trim(), password: passwordController.text, fcmtoken: token!));
                //       }
                //     }),
              ],
            ),
          ),
        ),
      ),
    );
  }

// goToNext() {
//   AppState appState = GetIt.I.get<AppState>();
//   appState.currentAction = PageAction(
//       // state: PageState.addPage, page: PageConfigs.securityQuestionPageConfig);
// }
}
