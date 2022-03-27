import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpInformationController extends GetxController{
  String ?email;
  String ?password;
  double ?weight;
  double ?height;
  String ?gender;

  

void assignEmailAndPassword(String input_email, String input_password){
  email=input_email;
  password= input_password;
  print("입력된 email은 ${email} 입력된 password는 ${password}");
}

void assignWeightAndHeightAndGender(double input_Weight){
  weight= input_Weight;
  
  print("입력된 email은 ${email} 입력된 password는 ${password}  입력된 weight는 ${weight}");
}




}