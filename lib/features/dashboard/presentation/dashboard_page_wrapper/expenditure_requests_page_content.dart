import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/providers/date_time_provider.dart';
import '../../../../core/utils/validators/form_validator.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_app_bar.dart';
import '../../../../core/widgets/custom/custom_dropdown_field.dart';
import '../../../../core/widgets/custom/custom_form_field.dart';
import '../../../../core/widgets/custom/date_time_bottom_sheet.dart';
import '../dashboard_provider/dashboard_provider.dart';

class ExpenditureScreen extends StatelessWidget {
  ExpenditureScreen({Key? key}) : super(key: key);
  DashboardProvider _dashboardProvider = sl();
  final DateTimeProvider _dateTimeProvider = sl();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: _dashboardProvider),
        ChangeNotifierProvider.value(value: _dateTimeProvider),
      ],
      builder: (context, child) {
        return ExpenditureScreenContent();
      },
    );
    ChangeNotifierProvider.value(value: _dashboardProvider, child: ExpenditureScreenContent());
  }
}

class ExpenditureScreenContent extends StatelessWidget {
  ExpenditureScreenContent({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: scafoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Expenditure Requests',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: context.read<DashboardProvider>().expenditureFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                const Text(
                  '   Sector',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropDown(
                  hintText: 'Select Selector',
                  labelText: '',
                  items: ['jonson', 'hello', 'help'],
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Text(
                  '   Project/Scheme',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomDropDown(
                  hintText: 'Select',
                  labelText: '',
                  items: ['jonson', 'hello', 'help'],
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text(
                  '  Remarks',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  maxLines: 7,
                  minLines: 7,
                  controller: emailController,
                  hintText: 'Enter Remarks',
                  labelText: '',
                  validator: FormValidators.validateEmail,
                  contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  // focusNode: context.read<DashboardProvider>().emailFocusNode,
                  onChanged: context.read<DashboardProvider>().onEmailChange,
                  onFieldSubmitted: (_) => context.read<DashboardProvider>().onEmailSubmitted(context),
                ),
                SizedBox(
                  height: 18.h,
                ),
                const Text(
                  '  Release Date',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  maxLines: 1,
                  readOnly: true,
                  suffixIconPath: AppAssets.icCalendarSvg,
                  keyboardType: TextInputType.datetime,
                  labelText: context.read<DashboardProvider>().releaseLabelText,
                  hintText: context.read<DashboardProvider>().releaseHintText,
                  controller: context.read<DashboardProvider>().expenditureController,
                  focusNode: context.read<DashboardProvider>().expiryFocusNode,
                  validator: context.read<DashboardProvider>().validateExpiryDate,
                  onChanged: context.read<DashboardProvider>().onExpiryDateChange,
                  onFieldSubmitted: (_) => context.read<DashboardProvider>().onExpiryDateSubmitted(context),
                  suffix: Icon(Icons.keyboard_arrow_down_rounded, color: Theme.of(context).canvasColor),
                  onTap: () async {
                    final selectDateTimeBottomSheet = DateTimeBottomSheet(context: context, initialSelectedDate: context.read<DashboardProvider>().releaseDate, isDob: false);
                    await selectDateTimeBottomSheet.show();
                    if (context.read<DateTimeProvider>().releaseDate.value != null) {
                      context.read<DashboardProvider>().expenditureController.text = DateFormat('yyyy-MM-dd').format(context.read<DateTimeProvider>().releaseDate.value!);
                    }
                  },
                ),
                SizedBox(
                  height: 18.h,
                ),
                const Text(
                  '  Amount',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  maxLines: 1,
                  controller: amountController,
                  hintText: 'Enter Amount',
                  labelText: '',
                  validator: FormValidators.validatePhone,
                  keyboardType: TextInputType.number,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  focusNode: context.read<DashboardProvider>().emailFocusNode,
                  onChanged: context.read<DashboardProvider>().onEmailChange,
                  onFieldSubmitted: (_) => context.read<DashboardProvider>().onEmailSubmitted(context),
                ),
                SizedBox(
                  height: 18.h,
                ),
                ContinueButton(
                    // loadingNotifier: context.read<LoginProvider>().loginLoading,
                    text: 'Submit',
                    backgroundColor: AppTheme.appTheme.primaryColor,
                    onPressed: () async {
                      FocusManager.instance.primaryFocus?.unfocus();

                      // if (_key.currentState!.validate()) {
                      //   context
                      //       .read<AuthProvider>()
                      //       .loginUser(LoginRequestModel(email: emailController.text.toLowerCase().trim(), password: passwordController.text, fcmtoken: token!));
                      // }
                    }),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
