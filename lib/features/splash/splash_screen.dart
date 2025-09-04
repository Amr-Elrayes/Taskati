import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/Home/home_screen.dart';
import 'package:taskati/features/upload/upload_screen.dart';
import 'package:taskati/services/local_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      bool isUploaded = LocalHelper.getData(LocalHelper.isUploaded) ?? false;
      pushReplacment(context, isUploaded ? HomeScreen() : UploadScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppImages.logojson),
            SizedBox(height: 5),
            Text("Taskati", style: TextStyles.bodystyle(fontSize: 24)),
            SizedBox(height: 15),
            Text("It's Time to Get Organized", style: TextStyles.smallstyle()),
          ],
        ),
      ),
    );
  }
}

//! fb
