import 'dart:async';

import 'package:flutter/material.dart';

import '../../configs/assets.dart';
import '../../routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() async {
      await AppAssets.precacheAssets(context);
      await Future.delayed(const Duration(milliseconds: 1500));
      await AppNavigator.replaceWith(Routes.screens);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.bgSplash),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
