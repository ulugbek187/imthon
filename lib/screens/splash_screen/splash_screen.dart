import 'package:flutter/material.dart';
import 'package:imthon/screens/global_screen/global_screen.dart';
import 'package:imthon/screens/tab_box.dart';
import 'package:lottie/lottie.dart';

import '../../utils/image/appimage.dart';
import '../../utils/styles/size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _init() {
    Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  TabScreen()));
      },
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.sizeOf(context).height;
    width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          AppImages.eComerse,
        ),
      ),
    );
  }
}
