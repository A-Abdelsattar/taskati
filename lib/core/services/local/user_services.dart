

import 'package:hive/hive.dart';
import 'package:taskati/core/utils/app_constants.dart';
import 'package:taskati/features/profile/models/user_model.dart';

class UserServices{

  static var userBox=Hive.box<UserModel>(AppConstants.userBoxId);

 static saveUser(UserModel user){
  userBox.put("user", user);
  }


  static UserModel getUSerData(){
   
   return  userBox.get("user") as UserModel;
  }





}