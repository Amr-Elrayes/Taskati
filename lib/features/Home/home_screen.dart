import 'dart:io';

import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/services/local_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hi, " + LocalHelper.getData(LocalHelper.Kname),
                        style: TextStyles.titlestyle(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Text("Have A Nice Day", style: TextStyles.bodystyle()),
                    ],
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppColors.primaryColor,
                    backgroundImage: LocalHelper.getData(LocalHelper.Kimage) != null
                        ? FileImage(File(LocalHelper.getData(LocalHelper.Kimage)))
                        : AssetImage(AppImages.user),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
