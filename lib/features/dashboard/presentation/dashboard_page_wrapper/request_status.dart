import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/custom_app_bar.dart';
import '../dashboard_provider/dashboard_provider.dart';

class RequestStatusScreen extends StatelessWidget {
  RequestStatusScreen({Key? key}) : super(key: key);
  DashboardProvider _dashboardProvider = sl();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(value: _dashboardProvider, child: const RequestStatusScreenContent());
  }
}

class RequestStatusScreenContent extends StatelessWidget {
  const RequestStatusScreenContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: scafoldBackgroundColor,
            appBar: CustomAppBar(
              title: 'Request Status',
            ),
            body:
                // mainAxisSize: MainAxisSize.min,
                ListView(
              // shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  tileColor: Colors.white,
                  title: const Text(
                    'Sector 1',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<DashboardProvider>().moveToDashboardScreen();
                  },
                  trailing: SizedBox(
                    width: 120.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Approved',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  tileColor: Colors.white,
                  title: const Text(
                    'Sector 2',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<DashboardProvider>().moveToDashboardScreen();
                  },
                  trailing: SizedBox(
                    width: 120.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Rejected',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  tileColor: Colors.white,
                  title: const Text(
                    'Sector 3',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<DashboardProvider>().moveToDashboardScreen();
                  },
                  trailing: SizedBox(
                    width: 120.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Pending',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  tileColor: Colors.white,
                  title: const Text(
                    'Sector 4',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    context.read<DashboardProvider>().moveToDashboardScreen();
                  },
                  trailing: SizedBox(
                    width: 120.w,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Approved',
                        style: TextStyle(fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ],
            )));
  }
}
