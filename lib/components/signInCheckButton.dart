import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_bouncy/style/style.dart';
import 'package:get/get.dart';

import '../controller/signInformationGetxController.dart';

class signInCheckButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey2;
  final FirebaseAuth? firebaseAuthInstanceSignIn;

  const signInCheckButton(
      {Key? key,
      @required this.formKey2,
      @required this.firebaseAuthInstanceSignIn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blue_400),
        onPressed: () async {
          formKey2!.currentState!.save();
          //formfield의 입력값을 분배하는거
          print('formKey2의 값은 ${formKey2}');

          String? email = Get.find<SignInformationController>().emailSignIn;
          String? password = Get.find<SignInformationController>().passwordSignIn;
          // controller 로 부터 email을 받아온다.
          print('signIn 버튼에서 email은${email}, 비밀번호는 ${password}이다.');

          try{
          final newUser = await firebaseAuthInstanceSignIn!.signInWithEmailAndPassword(email: email!, password: password!);
                if(newUser.user != null){
                   Get.snackbar('로그인 성공', '페이지를 이동합니다.');
              Get.offAndToNamed('/MainPage');
          }
         
          }
          catch(e){
            print(e);
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
              Text('Please check your email and password '),
              backgroundColor: blue_500,
            ));
          Get.snackbar('로그인 실패!', '이메일과 비밀번호를 확인해주세요');

          }
        },
        child: Text('저장하기!', style: TextStyle(color: Colors.white)));
  }
}
