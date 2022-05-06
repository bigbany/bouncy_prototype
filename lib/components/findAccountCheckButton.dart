import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_bouncy/style/style.dart';
import 'package:get/get.dart';

import '../controller/signInformationGetxController.dart';

class findAccountCheckButton extends StatelessWidget {
  final GlobalKey<FormState>? formKey2;

  const findAccountCheckButton({
    Key? key,
    @required this.formKey2,
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

            String? TempEmail = Get.find<SignInformationController>().temp_email;
            // controller 로 부터 email을 받아온다.
            
            // Get.find<SignUpInformationController>()
            //     .assignEmailAndPassword(email?? 'null 이다', password?? "");
            Get.snackbar('저장완료!', '폼 저장이 완료되었습니다!');
          }
        },
        child: Text('저장하기!', style: TextStyle(color: Colors.white)));
  }
}
