import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quicks_cart/utils/constants/colors.dart';
import 'package:quicks_cart/utils/constants/text_strings.dart';
import 'package:quicks_cart/utils/theme/theme.dart';

import 'bindings/general_bindings.dart';

class QCApp extends StatelessWidget {
  const QCApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: QCTexts.appName,
      themeMode: ThemeMode.system,
      theme: QCAppTheme.lightTheme,
      darkTheme: QCAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: Scaffold(
        backgroundColor: QCColors.primary,
        body: Center(child: CircularProgressIndicator(color: QCColors.white)),
      ),
    );
  }
}
