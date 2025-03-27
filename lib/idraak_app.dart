import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idraak/core/helper/global_navigator.dart';
import 'package:idraak/core/routing/app_router.dart';
import 'package:idraak/core/routing/routes.dart';

class IdraakApp extends StatelessWidget {
  final AppRouter appRouter;
  const IdraakApp({super.key, required this.appRouter});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder:
          (context, child) => MaterialApp(
            title: 'Idraak',
            debugShowCheckedModeBanner: false,
            navigatorKey: NavigationService.navigatorKey,
            theme: ThemeData(fontFamily: 'Kufam'),
            initialRoute: Routes.splashScreen,
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
    );
  }
}
