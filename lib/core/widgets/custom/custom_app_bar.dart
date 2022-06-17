import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../features/authentication/presentation/auth_provider/authentication_Provider.dart';
import '../../constants/app_assets.dart';
import '../../utils/globals/globals.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar({required this.title, Key? key}) : super(key: key);

  final String title;
  // final String scafldKey;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          AuthProvider authProvider = sl();
          authProvider.removeToDashboard();
        },
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
      titleSpacing: 2,
      toolbarHeight: 80.h,
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1?.copyWith(fontSize: 20, color: const Color(0xFF2A9488).withOpacity(0.85))),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
