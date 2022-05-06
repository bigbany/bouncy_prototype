import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignInformationController extends GetxController {
  String? email;
  String? password;
  double? weight;
  double? height;
  String? gender;
    String? temp_email;
    // findaccountpage 에서도 해당 콘트롤러가 사용된다.
String? emailSignIn;
String? passwordSignIn;




  void assignEmailSignIn(String inputEmailSignIn) {
    emailSignIn = inputEmailSignIn;
    print('From controller |emailSignIn 값은 ${emailSignIn}이다.');
  }

  void assignPasswordSignIn(String inputPasswordSignIn) {
    passwordSignIn = inputPasswordSignIn;
    print('From signInformation controller |passwordSignIn 값은 ${passwordSignIn}이다.');
  }



  void assignEmail(String input_email) {
    email = input_email;
    print('From controller |email 값은 ${email}이다.');
  }

  void assignPassword(String input_password) {
    password = input_password;
    print('From controller |password 값은 ${password}이다.');
  }

  void assignEmailAndPassword(String input_email, String input_password) {
    email = input_email;
    password = input_password;
    print("입력된 email은 ${email} 입력된 password는 ${password}");
  }

  void assignTempEmail(String input_temp_email){
  temp_email= input_temp_email;
  print('From signinInformation cotroller | temp_email 값은 ${temp_email}이다.');
}

  void assignWeightAndHeightAndGender(double input_Weight) {
    weight = input_Weight;

    print(
        "입력된 email은 ${email} 입력된 password는 ${password}  입력된 weight는 ${weight}");
  }
}
