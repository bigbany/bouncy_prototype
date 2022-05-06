import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_bouncy/style/style.dart';
import 'package:get/get.dart';

import '../controller/signInformationGetxController.dart';

class signUpCheckButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey2;
  final FirebaseAuth? firebaseAuthInstanceSignUp;
  // firebase auth instance 넘겨받기
  const signUpCheckButton({
    Key? key,
    @required this.formKey2,
    @required this.firebaseAuthInstanceSignUp
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: blue_400),
        onPressed: () async {
          if (formKey2!.currentState!.validate()) {
            formKey2!.currentState!.save();
            //formfield의 입력값을 분배하는거
            print('formKey2의 값은 ${formKey2}');

            String? email = Get.find<SignInformationController>().email;
            String? password = Get.find<SignInformationController>().password;
            // controller 로 부터 email을 받아온다.
            // Get.find<SignUpInformationController>()
            //     .assignEmailAndPassword(email?? 'null 이다', password?? "");
            try{
           final newUser =  
           await firebaseAuthInstanceSignUp!.createUserWithEmailAndPassword(email: email!, password: password!);
          if(newUser.user != null){
            Get.snackbar('회원가입완료!', '페이지로 이동합니다.');
              Get.offAndToNamed('/MainPage');
          }
         
          } catch(e){
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
              Text('Please check your email and password '),
              backgroundColor: blue_500,
            ));
               Get.snackbar('회원가입 실패!', '다시 입력해주세요');
          }

          }
        },
        child: Text('저장하기!', style: TextStyle(color: Colors.white)));
  }
}
