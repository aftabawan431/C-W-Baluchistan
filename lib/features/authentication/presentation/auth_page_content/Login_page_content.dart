import 'package:cw_blochistan/core/constants/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/validators/form_validator.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_form_field.dart';
import '../auth_provider/authentication_Provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  AuthProvider _authProvider = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _authProvider, child: LoginScreenContent());
  }
}

class LoginScreenContent extends StatelessWidget {
  LoginScreenContent({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
                  'Login to Continue',
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
                    key: context.read<AuthProvider>().loginFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        const Text('  Email'),
                        CustomTextFormField(
                          maxLines: 1,
                          controller: emailController,
                          hintText: 'Enter Email',
                          labelText: '',
                          validator: FormValidators.validateEmail,
                          contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          focusNode: context.read<AuthProvider>().emailFocusNode,
                          onChanged: context.read<AuthProvider>().onEmailChange,
                          onFieldSubmitted: (_) => context.read<AuthProvider>().onEmailSubmitted(context),
                        ),
                        SizedBox(
                          height: 18.h,
                        ),
                        const Text('  Password'),
                        ValueListenableBuilder<bool>(
                          valueListenable: context.read<AuthProvider>().obsecureTextNotifier,
                          builder: (_, obsecureText, __) {
                            return CustomTextFormField(
                              controller: passwordController,
                              hintText: 'Enter Password',
                              labelText: '',
                              obscureText: obsecureText,
                              suffixIconPath: obsecureText ? AppAssets.icPasswordSvg : AppAssets.icEyeOpenSvg,
                              suffixIconOnTap: context.read<AuthProvider>().onObsecureChange,
                              maxLines: 1,
                              validator: FormValidators.validateLoginPassword,
                              contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              onFieldSubmitted: (_) => context.read<AuthProvider>().onPasswordSubmitted(context),
                              onChanged: context.read<AuthProvider>().onPasswordChange,
                              focusNode: context.read<AuthProvider>().passwordFocusNode,
                            );
                          },
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              context.read<AuthProvider>().moveToForgetPasswordEmail();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        ContinueButton(
                            // loadingNotifier: context.read<LoginProvider>().loginLoading,
                            text: 'Login',
                            backgroundColor: AppTheme.appTheme.primaryColor,
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.read<AuthProvider>().moveToDashboard();

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
