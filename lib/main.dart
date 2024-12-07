import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zakah_for_years/app/data/shared/constant.dart';

import 'app/routes/app_pages.dart';
import 'package:oktoast/oktoast.dart';
void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.rtl,
      child: OKToast(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
              primaryColor: kPrimaryColor,
              floatingActionButtonTheme:
                  FloatingActionButtonThemeData(backgroundColor: kPrimaryColor)),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        ),
      ),
    ),
  );
}
