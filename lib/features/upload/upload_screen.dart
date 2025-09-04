import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/app_images.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/functions/snackbar.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_buttom.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/features/Home/home_screen.dart';
import 'package:taskati/services/local_helper.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String imgPath = '';
  var namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              if (imgPath.isNotEmpty && namecontroller.text.isNotEmpty) {
                LocalHelper.putUserData(imgPath, namecontroller.text);
                pushAndRemoveUntil(context, HomeScreen());
                showSnakBar(
                  context,
                  AppColors.successColor,
                  "Data Added Successfully",
                );
              } else if (imgPath.isEmpty && namecontroller.text.isNotEmpty) {
                showSnakBar(
                  context,
                  AppColors.redColor,
                  "Please Upload an Image",
                );
              } else if (imgPath.isNotEmpty && namecontroller.text.isEmpty) {
                showSnakBar(
                  context,
                  AppColors.redColor,
                  "Please Enter Your Name",
                );
              } else {
                showSnakBar(
                  context,
                  AppColors.redColor,
                  "Please Upload an Image And Enter Your Name",
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text("Done", style: TextStyles.bodystyle(fontSize: 18)),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: AppColors.primaryColor,
                  backgroundImage: imgPath.isNotEmpty
                      ? FileImage(File(imgPath))
                      : AssetImage(AppImages.user),
                ),
                Gap(40),
                customButtom(
                  txt: "Upload From Camera",
                  onPressed: () async {
                    await uploadImage(isCamera: true);
                  },
                  width: 310,
                  height: 60,
                ),
                Gap(20),
                customButtom(
                  txt: "Upload From Gallary",
                  onPressed: () async {
                    await uploadImage(isCamera: false);
                  },
                  width: 310,
                  height: 60,
                ),
                Gap(20),
                Divider(color: AppColors.grayColor, thickness: 1),
                Gap(20),
                customTextformfield(
                  hintText: "Enter Your Name",
                  controller: namecontroller,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> uploadImage({required bool isCamera}) async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(
      source: isCamera ? ImageSource.camera : ImageSource.gallery,
    );
    if (file != null) {
      setState(() {
        imgPath = file.path;
      });
    }
  }
}
