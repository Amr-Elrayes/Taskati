import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/functions/navigation.dart';
import 'package:taskati/core/functions/snackbar.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/core/widgets/custom_buttom.dart';
import 'package:taskati/core/widgets/custom_text_field.dart';
import 'package:taskati/features/Home/home_screen.dart';
import 'package:taskati/services/local_helper.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String imgPath = LocalHelper.getData(LocalHelper.Kimage);
  var namecontroller = TextEditingController(text: LocalHelper.getData(LocalHelper.Kname));
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
                  "Data Updated Successfully",
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
                  backgroundImage: FileImage(File(imgPath)),
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
                customTextformfield(controller: namecontroller),
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
