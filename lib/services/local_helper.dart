import 'package:hive/hive.dart';

class LocalHelper {

  static late Box userBox;
  static String Kname = "name";
  static String Kimage = "image";
  static String isUploaded = "isUploaded";

  static init()
  async{
      userBox = await Hive.openBox("userBox");
  }

  static putData(String key , dynamic value)
  {
    userBox.put(key, value);
  }

  static getData(String key)
  {
    return userBox.get(key);
  }

  static putUserData(String imgPath , String name)
  {
    putData(Kname, name);
    putData(Kimage, imgPath);
    putData(isUploaded, true);
  }
}