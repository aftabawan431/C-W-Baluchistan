import 'package:cw_blochistan/features/dashboard/presentation/dashboard_provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants/app_assets.dart';

class DashboardDrawerWidget extends StatelessWidget {
  const DashboardDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        // padding: EdgeInsets.zero,
        children: <Widget>[
          SizedBox(
            height: 100.h,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [SvgPicture.asset(AppAssets.icLogoRightSvg, width: 65.w)],
              ),
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppAssets.icExpenditureSvg,
            ),
            tileColor: Colors.white,
            title: const Text(
              'Inspection Report',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.read<DashboardProvider>().moveToInspectionScreen();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppAssets.icReleaseSvg,
            ),
            tileColor: Colors.white,
            title: const Text(
              'Release Requests',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.read<DashboardProvider>().moveToReleaseRequestScreen();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppAssets.icExpenditureSvg,
            ),
            tileColor: Colors.white,
            title: const Text(
              'Expenditure Request',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.read<DashboardProvider>().moveToExpenditureScreen();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppAssets.icRequestStatuesSvg,
            ),
            tileColor: Colors.white,
            title: const Text(
              'Request Statues',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.read<DashboardProvider>().moveToRequestStatusScreen();
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              AppAssets.icLogoutSvg,
            ),
            tileColor: Colors.white,
            title: const Text(
              'Logout',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              context.read<DashboardProvider>().moveToLoginScreen();
            },
          ),
        ],
      ),
    );
  }
}
