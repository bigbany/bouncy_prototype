import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../controller/signUpInformationGetxController.dart';

class signUpCheckButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey2;

  const signUpCheckButton({
    Key? key,
    @required this.formKey2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: () async {
          if (formKey2!.currentState!.validate()) {
            formKey2!.currentState!.save();
            //formfield의 입력값을 분배하는거
            print('formKey2의 값은 ${formKey2}');

            String? email = Get.find<SignUpInformationController>().email;
            String? password = Get.find<SignUpInformationController>().password;
            // controller 로 부터 email을 받아온다.
            
            // Get.find<SignUpInformationController>()
            //     .assignEmailAndPassword(email?? 'null 이다', password?? "");
            Get.snackbar('저장완료!', '폼 저장이 완료되었습니다!');
          }
        },
        child: Text('저장하기!', style: TextStyle(color: Colors.white)));
  }
}
