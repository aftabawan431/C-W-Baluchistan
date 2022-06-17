import 'package:cw_blochistan/core/router/models/page_keys.dart';
import 'package:cw_blochistan/core/router/models/page_paths.dart';

import '../pages.dart';

class PageConfigs {
  static PageConfiguration splashPageConfig = const PageConfiguration(key: PageKeys.splashPageKey, path: PagePaths.splashPagePath, uiPage: Pages.splashPage);

  static PageConfiguration loginPageConfig = const PageConfiguration(key: PageKeys.loginPageKey, path: PagePaths.loginPathPath, uiPage: Pages.loginPage);
  static PageConfiguration forgetPasswordEmailPageConfig =
      const PageConfiguration(key: PageKeys.forgetPasswordEmailPageKey, path: PagePaths.forgetEmailPagePath, uiPage: Pages.forgetEmailPage);
  static PageConfiguration forgetConfirmPasswordPageConfig =
      const PageConfiguration(key: PageKeys.forgetConfirmPasswordPageKey, path: PagePaths.forgetPasswordPagePath, uiPage: Pages.forgetPasswordPage);
  static PageConfiguration dashBoardMainScreenPageConfig =
      const PageConfiguration(key: PageKeys.dashBoardMainScreenPageKey, path: PagePaths.dashBoardMainScreenPagePath, uiPage: Pages.dashBoardMainScreenPage);
  static PageConfiguration expenditureRequestPageConfig =
      const PageConfiguration(key: PageKeys.expenditureRequestScreenPageKey, path: PagePaths.expenditureRequestScreenPagePath, uiPage: Pages.expenditureRequest);
  static PageConfiguration inspectionReportPageConfig =
      const PageConfiguration(key: PageKeys.inspectionReportScreenPageKey, path: PagePaths.inspectionReportPagePath, uiPage: Pages.inspectionReportPage);
  static PageConfiguration releaseRequestPageConfig =
      const PageConfiguration(key: PageKeys.releaseRequestScreenPageKey, path: PagePaths.releaseRequestScreenPagePath, uiPage: Pages.releaseRequestScreenPage);
  static PageConfiguration requestStatusPageConfig =
      const PageConfiguration(key: PageKeys.requestStatusScreenPageKey, path: PagePaths.requestStatusScreenPagePath, uiPage: Pages.requestStatusScreenPage);
}
