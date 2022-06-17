import 'dart:convert';
import 'dart:io';

import 'package:cw_blochistan/core/router/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/models/on_error_message_model.dart';
import '../../../../core/router/models/page_action.dart';
import '../../../../core/router/models/page_config.dart';
import '../../../../core/utils/enums/attachment_type.dart';
import '../../../../core/utils/enums/page_state_enum.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/validators/form_validator.dart';

class DashboardProvider extends ChangeNotifier {
  ValueNotifier<bool> obsecureTextNotifier = ValueNotifier(true);

  bool isButtonPressed = false;
  bool isEmailError = false;
  bool isPasswordError = false;
  bool isDocumentPageButtonPressed = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final String inspectionReportLabelText = '';
  final String inspectionReportHintText = 'Select Image';
  final TextEditingController inspectionReportController = TextEditingController();
  final FocusNode inspectionReportFocusNode = FocusNode();

  final String inspectionReportGPSLabelText = '';
  final String inspectionReportGPSHintText = 'Select GPS';
  final TextEditingController inspectionReportGPSController = TextEditingController();
  final FocusNode inspectionReportGPSFocusNode = FocusNode();

  DateTime releaseDate = DateTime.now();
  final String releaseLabelText = '';
  final String releaseHintText = 'dd/mm/yy';
  final TextEditingController releaseController = TextEditingController();
  final TextEditingController expenditureController = TextEditingController();
  final FocusNode expiryFocusNode = FocusNode();

  // Methods
  void onEmailSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus(passwordFocusNode);
  }

  void onPasswordSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  bool isExpiryDateError = false;
  final GlobalKey<FormState> expenditureFormKey = GlobalKey<FormState>();

  String? validateExpiryDate(String? value) {
    if (!isDocumentPageButtonPressed) {
      return null;
    }
    isExpiryDateError = true;
    var result = FormValidators.validateExpiryDate(value?.trim());
    if (result == null) {
      isExpiryDateError = false;
    }
    return result;
  }

  void onExpiryDateSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus();
  }

  void onExpiryDateChange(String value) {
    isDocumentPageButtonPressed = false;
    if (isExpiryDateError) {
      expenditureFormKey.currentState!.validate();
    }
  }

  bool isinspectionReportButtonPressed = false;
  bool isinspectionReporteError = false;
  String? validateFrontSide(String? value) {
    if (!isinspectionReportButtonPressed) {
      return null;
    }
    isinspectionReporteError = true;
    var result = FormValidators.validateInspectionReportImage(value?.trim());
    if (result == null) {
      isinspectionReporteError = false;
    }
    return result;
  }

  final GlobalKey<FormState> inspectionReportFormKey = GlobalKey<FormState>();

  void onFrontSideSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus(inspectionReportFocusNode);
  }

  void onFrontSideChange(String value) {
    isinspectionReportButtonPressed = false;
    if (isinspectionReporteError) {
      inspectionReportFormKey.currentState!.validate();
    }
  }

  String? encodeToBase64(File? file) {
    if (file != null) {
      List<int> imageBytes = file.readAsBytesSync();
      return base64Encode(imageBytes);
    }
    return null;
  }

  String? frontSide;
  String? backSide;
  String? utilityBill;
  ValueChanged<OnErrorMessageModel>? onErrorMessage;

  XFile? selectedFile;
  ValueNotifier<File?> docsImgFile = ValueNotifier(null);
  Future<void> pickFiles(BuildContext context, AttachmentType type, String source) async {
    selectedFile = null;
    try {
      switch (source) {
        case 'camera':
          selectedFile = (await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50));
          break;
        case 'gallery':
          selectedFile = (await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 50));
          break;
      }
      if (selectedFile != null) {
        docsImgFile.value = File(selectedFile!.path);
        String? base64 = encodeToBase64((docsImgFile.value));
        if (base64 != null) {
          switch (type) {
            case AttachmentType.inspectionReport:
              frontSide = base64;
              inspectionReportController.text = docsImgFile.value!.path.split('/').last;
              break;
            case AttachmentType.backSide:
              backSide = base64;
              // backSideController.text = docsImgFile.value!.path.split('/').last;
              break;
            case AttachmentType.utilityBill:
              utilityBill = base64;
              // utilityController.text = docsImgFile.value!.path.split('/').last;
              break;
          }
        }
      }
    } on PlatformException catch (e) {
      onErrorMessage?.call(OnErrorMessageModel(message: e.message.toString()));
    } catch (e) {
      onErrorMessage?.call(OnErrorMessageModel(message: e.toString()));
    }
  }

  Future<void> inspectionDetailsImageSelector(context, AttachmentType attachmentType) async {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SizedBox(
              height: 150,
              child: Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.photo_camera,
                      color: appGreenColor,
                    ),
                    title: const Text('Camera'),
                    onTap: () {
                      pickFiles(context, attachmentType, 'camera');
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                      leading: Icon(
                        Icons.photo_library,
                        color: appGreenColor,
                      ),
                      title: const Text('Pick From Gallery'),
                      onTap: () {
                        pickFiles(context, attachmentType, 'gallery');
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  void onObsecureChange() {
    obsecureTextNotifier.value = !obsecureTextNotifier.value;
  }

  void onEmailChange(String value) {
    isButtonPressed = false;
    if (isEmailError) {
      formKey.currentState!.validate();
    }
  }

  void onPasswordChange(String value) {
    isButtonPressed = false;
    if (isPasswordError) {
      formKey.currentState!.validate();
    }
  }

  AppState appState = GetIt.I.get<AppState>();

  void moveToDashboardScreen() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.dashBoardMainScreenPageConfig);
  }

  void moveToLoginScreen() {
    appState.currentAction = PageAction(state: PageState.replaceAll, page: PageConfigs.loginPageConfig);
  }

  void moveToExpenditureScreen() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.expenditureRequestPageConfig);
  }

  void moveToInspectionScreen() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.inspectionReportPageConfig);
  }

  void moveToReleaseRequestScreen() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.releaseRequestPageConfig);
  }

  void moveToRequestStatusScreen() {
    appState.currentAction = PageAction(state: PageState.addPage, page: PageConfigs.requestStatusPageConfig);
  }
}
