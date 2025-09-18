import 'dart:io';
import 'package:flutter/material.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/edit_profile_info/edit_profile.dart';
import 'package:taskati/services/local_helper.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, " + LocalHelper.getData(LocalHelper.Kname),
              style: TextStyles.titlestyle(color: AppColors.primaryColor),
            ),
            Text("Have A Nice Day", style: TextStyles.bodystyle()),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            IconButton(
              onPressed: () {
                LocalHelper.changeTheme();
              },
              icon: Icon(
                Icons.dark_mode_rounded,
                color: AppColors.orangeColor,
                size: 30,
              ),
            ),
            GestureDetector(
              onTap: () {
                pushTo(context, EditProfile());
              },
              child: CircleAvatar(
                radius: 30,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: LocalHelper.getData(LocalHelper.Kimage) != null
                    ? FileImage(File(LocalHelper.getData(LocalHelper.Kimage)))
                    : AssetImage(AppImages.user),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
