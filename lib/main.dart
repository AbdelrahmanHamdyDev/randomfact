import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:randomfact/view/home.dart';

import 'package:dynamic_color/dynamic_color.dart';

void main() async {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) {
            return MaterialApp(
              theme: ThemeData.from(
                colorScheme: lightDynamic ?? ColorScheme.light(),
              ),
              darkTheme: ThemeData.from(
                colorScheme: darkDynamic ?? ColorScheme.dark(),
              ),
              home: homeScreen(),
            );
          },
        );
      },
    ),
  );
}
