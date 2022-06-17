import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/bar_chart_sample1.dart';
import '../../../../core/widgets/custom/pie_chart_sample2.dart';
import '../../../../core/widgets/dashboard_drawer.dart';
import '../dashboard_provider/dashboard_provider.dart';

class DashboardMainScreen extends StatelessWidget {
  DashboardMainScreen({Key? key}) : super(key: key);
  DashboardProvider _dashboardProvider = sl();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _dashboardProvider, child: DashboardMainScreenContent());
  }
}

class DashboardMainScreenContent extends StatelessWidget {
  DashboardMainScreenContent({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: scafoldBackgroundColor,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleSpacing: 2,
        toolbarHeight: 80.h,
        leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            child: SvgPicture.asset(AppAssets.icMenuSvg, width: 75.w)),
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: Text('Dashboard', style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20, color: const Color(0xFF2A9488).withOpacity(0.85))),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: SvgPicture.asset(
              AppAssets.icLogoRightSvg,
            ),
          ),
          SizedBox(width: 22.w),
        ],
      ),
      drawer: const DashboardDrawerWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BarChartSample1(),
            PieChartSample2(),
          ],
        ),
      ),
    ));
  }
}
