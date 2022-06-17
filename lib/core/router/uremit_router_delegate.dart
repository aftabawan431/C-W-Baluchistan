import 'package:cw_blochistan/core/utils/extension/extensions.dart';
import 'package:cw_blochistan/features/dashboard/presentation/dashboard_page_wrapper/expenditure_requests_page_content.dart';
import 'package:cw_blochistan/features/dashboard/presentation/dashboard_page_wrapper/inspection_report_page_content.dart';
import 'package:cw_blochistan/features/dashboard/presentation/dashboard_page_wrapper/release_request_page_content.dart';
import 'package:cw_blochistan/features/dashboard/presentation/dashboard_page_wrapper/request_status.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../features/authentication/presentation/auth_page_content/Login_page_content.dart';
import '../../features/authentication/presentation/auth_page_content/forget_password_wrapper/forget_password_confirm_password_page_content.dart';
import '../../features/authentication/presentation/auth_page_content/forget_password_wrapper/forget_password_email_page_content.dart';
import '../../features/dashboard/presentation/dashboard_page_wrapper/dashboard_main_page_content.dart';
import '../../features/splash_screen/presentation/pages/splash_screen.dart';
import '../utils/enums/page_state_enum.dart';
import '../utils/globals/globals.dart';
import 'app_state.dart';
import 'pages.dart';

BuildContext? globalHomeContext; // doing this to pop the bottom sheet on home screen

class CWBaluchistanRouterDelegate extends RouterDelegate<PageConfiguration> with ChangeNotifier, PopNavigatorRouterDelegateMixin<PageConfiguration> {
  late final AppState appState;
  final List<Page> _pages = [];
  late BackButtonDispatcher backButtonDispatcher;

  List<MaterialPage> get pages => List.unmodifiable(_pages);

  CWBaluchistanRouterDelegate(this.appState) {
    appState.addListener(() {
      notifyListeners();
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Faulty Code will need to find a way to solve it
    appState.globalErrorShow = (value) {
      context.show(message: value);
    };

    return Container(
      key: ValueKey(pages.last.name),
      child: Navigator(
        key: navigatorKeyGlobal,
        onPopPage: _onPopPage,
        pages: buildPages(),
      ),
    );
  }

  List<Page> buildPages() {
    switch (appState.currentAction.state) {
      case PageState.none:
        break;
      case PageState.addPage:
        addPage(appState.currentAction.page!);
        break;
      case PageState.remove:
        removePage(appState.currentAction.page!);
        break;

      case PageState.pop:
        pop();
        break;
      case PageState.addAll:
        // TODO: Handle this case.
        break;
      case PageState.addWidget:
        pushWidget(appState.currentAction.widget!, appState.currentAction.page!);
        break;
      case PageState.replace:
        replace(appState.currentAction.page!);
        break;
      case PageState.replaceAll:
        replaceAll(appState.currentAction.page!);
        break;
    }
    return List.of(_pages);
  }

  void pushWidget(Widget child, PageConfiguration newRoute) {
    _addPageData(child, newRoute);
  }

  void replaceAll(PageConfiguration newRoute) {
    _pages.clear();
    setNewRoutePath(newRoute);
  }

  void replace(PageConfiguration newRoute) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    addPage(newRoute);
  }

  void removePage(PageConfiguration page) {
    if (_pages.isEmpty) {
      pages.remove(page);
    }
  }

  /// This method adds pages based on the PageConfig received
  /// [Input]: [PageConfiguration]
  void addPage(PageConfiguration pageConfig) {
    final shouldAddPage = _pages.isEmpty || (_pages.last.name != pageConfig.path);

    if (shouldAddPage) {
      switch (pageConfig.uiPage) {
        case Pages.splashPage:
          // _addPageData(ExpenditureScreen(), pageConfig);
          _addPageData(const SplashScreen(), pageConfig);
          break;
        case Pages.loginPage:
          _addPageData(LoginScreen(), pageConfig);
          break;
        case Pages.forgetEmailPage:
          _addPageData(ForgetEnterEmailScreen(), pageConfig);
          break;
        case Pages.forgetPasswordPage:
          _addPageData(ForgetConfirmPasswordScreen(), pageConfig);
          break;
        case Pages.dashBoardMainScreenPage:
          _addPageData(DashboardMainScreen(), pageConfig);
          break;
        case Pages.expenditureRequest:
          _addPageData(ExpenditureScreen(), pageConfig);
          break;
        case Pages.inspectionReportPage:
          _addPageData(InspectionReportScreen(), pageConfig);
          break;
        case Pages.releaseRequestScreenPage:
          _addPageData(ReleaseScreen(), pageConfig);
          break;
        case Pages.requestStatusScreenPage:
          _addPageData(RequestStatusScreen(), pageConfig);
          break;
      }
    }
  }

  void _addPageData(Widget child, PageConfiguration pageConfig) {
    _pages.add(
      _createPage(child, pageConfig),
    );
  }

  MaterialPage _createPage(Widget child, PageConfiguration pageConfig) {
    return MaterialPage(child: child, key: ValueKey(pageConfig.key), name: pageConfig.path, arguments: pageConfig);
  }

  bool _onPopPage(Route<dynamic> route, result) {
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }
    if (canPop()) {
      pop();
      return true;
    } else {
      return false;
    }
  }

  void pop() {
    if (globalHomeContext != null) {
      Navigator.of(globalHomeContext!).pop();
      globalHomeContext = null;
      return;
    }
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
    } else {
      // if (_pages.last.name != PagePaths.authWrapperPagePath) {
      //   _homeViewModel.onBottomNavTap(0);
      // }
    }
  }

  void _removePage(MaterialPage page) {
    _pages.remove(page);
    // notifyListeners();
  }

  bool canPop() {
    return _pages.length > 1;
  }

  @override
  Future<bool> popRoute() {
    if (canPop()) {
      _removePage(_pages.last as MaterialPage);
      return Future.value(true);
    }
    return Future.value(false);
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) {
    final shouldAddPage = _pages.isEmpty || (_pages.last.name != configuration.path);

    if (!shouldAddPage) {
      return SynchronousFuture(null);
    }
    _pages.clear();
    addPage(configuration);

    return SynchronousFuture(null);
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => navigatorKeyGlobal;
}
