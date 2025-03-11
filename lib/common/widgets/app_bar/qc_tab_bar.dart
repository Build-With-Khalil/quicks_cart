import 'package:flutter/material.dart';
import 'package:quicks_cart/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/device/device_utility.dart';

class QcTabBar extends StatelessWidget implements PreferredSizeWidget {
  const QcTabBar({super.key, required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    final dark = QCHelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? QCColors.black : QCColors.white,
      child: TabBar(
        tabAlignment: TabAlignment.start,
        tabs: tabs,
        isScrollable: true,
        indicatorColor: QCColors.primary,
        labelColor: dark ? QCColors.white : QCColors.primary,
        unselectedLabelColor: QCColors.darkGrey,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(QCDeviceUtils.getAppBarHeight());
}
