// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:idraak/core/helper/global_navigator.dart';
import 'package:idraak/core/routing/routes.dart';
import 'package:idraak/core/theming/app_image.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool androidIs12OrAbove = false; // Initialize with default value
  bool _isLoading = true; // Add loading state
  @override
  void initState() {
    super.initState();
    android12OrAbove();
  }

  Future<void> android12OrAbove() async {
    androidIs12OrAbove =
        Platform.isAndroid ? await isAndroid12OrAbove() : false;
    setState(() {
      _isLoading = false; // Update loading state
    });
    await initSplashScreen(context: context);
    log(androidIs12OrAbove.toString());
  }

  Future<bool> isAndroid12OrAbove() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    log(androidInfo.version.sdkInt.toString());
    // Android 12 corresponds to API level 31
    return androidInfo.version.sdkInt >= 31;
  }

  Future<void> initSplashScreen({required BuildContext context}) async {
    if (androidIs12OrAbove && !Platform.isIOS) {
      Navigator.of(
        NavigationService.navigatorKey.currentContext!,
      ).pushReplacementNamed(Routes.homeScreen);
    } else {
      Timer(
        Duration(seconds: 6),
        () => Navigator.of(
          NavigationService.navigatorKey.currentContext!,
        ).pushReplacementNamed(Routes.homeScreen),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox.shrink(); // Show blank screen while loading
    }
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body:
          androidIs12OrAbove && !Platform.isIOS
              ? const SizedBox.shrink()
              : Center(
                child: Image.asset(
                  AppImage.splashScreenLogo,
                  width: 212.w,
                  height: 122.h,
                ),
              ),
    );
  }
}
