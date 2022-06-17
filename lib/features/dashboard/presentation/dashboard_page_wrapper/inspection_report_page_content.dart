import 'package:cw_blochistan/core/widgets/custom/custom_app_bar.dart';
import 'package:cw_blochistan/core/widgets/custom/custom_dropdown_field.dart';
import 'package:cw_blochistan/features/dashboard/presentation/dashboard_provider/dashboard_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/utils/enums/attachment_type.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/validators/form_validator.dart';
import '../../../../core/widgets/custom/continue_button.dart';
import '../../../../core/widgets/custom/custom_form_field.dart';

class InspectionReportScreen extends StatelessWidget {
  InspectionReportScreen({Key? key}) : super(key: key);
  DashboardProvider _dashboardProvider = sl();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _dashboardProvider, child: InspectionReportScreenContent());
  }
}

class InspectionReportScreenContent extends StatelessWidget {
  InspectionReportScreenContent({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: scafoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Inspection Report',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
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
                '  Inspection Report',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                maxLines: 1,
                controller: emailController,
                hintText: 'Enter Details',
                labelText: '',
                validator: FormValidators.validateEmail,
                contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                focusNode: context.read<DashboardProvider>().emailFocusNode,
                onChanged: context.read<DashboardProvider>().onEmailChange,
                onFieldSubmitted: (_) => context.read<DashboardProvider>().onEmailSubmitted(context),
              ),
              SizedBox(
                height: 18.h,
              ),
              const Text(
                '  GPS Coordinate',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                maxLines: 1,
                readOnly: true,
                suffixIconPath: AppAssets.icAddressSvg,
                keyboardType: TextInputType.name,
                labelText: context.read<DashboardProvider>().inspectionReportGPSLabelText,
                hintText: context.read<DashboardProvider>().inspectionReportGPSHintText,
                controller: context.read<DashboardProvider>().inspectionReportGPSController,
                focusNode: context.read<DashboardProvider>().inspectionReportGPSFocusNode,
                validator: context.read<DashboardProvider>().validateFrontSide,
                onChanged: context.read<DashboardProvider>().onFrontSideChange,
                onFieldSubmitted: (_) => context.read<DashboardProvider>().onFrontSideSubmitted(context),
                onTap: () async {
                  // await context.read<DashboardProvider>().inspectionDetailsImageSelector(context, AttachmentType.inspectionReport);
                },
              ),
              SizedBox(
                height: 18.h,
              ),
              const Text(
                '  Image',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextFormField(
                maxLines: 1,
                readOnly: true,
                suffixIconPath: AppAssets.icCameraSvg,
                keyboardType: TextInputType.name,
                labelText: context.read<DashboardProvider>().inspectionReportLabelText,
                hintText: context.read<DashboardProvider>().inspectionReportHintText,
                controller: context.read<DashboardProvider>().inspectionReportController,
                focusNode: context.read<DashboardProvider>().inspectionReportFocusNode,
                validator: context.read<DashboardProvider>().validateFrontSide,
                onChanged: context.read<DashboardProvider>().onFrontSideChange,
                onFieldSubmitted: (_) => context.read<DashboardProvider>().onFrontSideSubmitted(context),
                onTap: () async {
                  await context.read<DashboardProvider>().inspectionDetailsImageSelector(context, AttachmentType.inspectionReport);
                },
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
    ));
  }
}
