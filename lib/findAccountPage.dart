
import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/RegExp/regExp.dart';
import 'package:flutter_application_bouncy/components/findAccountCheckButton.dart';
import 'package:flutter_application_bouncy/components/homeButton.dart';
import 'package:flutter_application_bouncy/components/signInTextFormFieldEmail.dart';
import 'package:flutter_application_bouncy/components/signUpTextFormFieldEmail.dart';
import 'package:flutter_application_bouncy/controller/signInformationGetxController.dart';
import 'package:get/get.dart';

class findAccountPage extends StatefulWidget {
  const findAccountPage({ Key? key }) : super(key: key);

  @override
  State<findAccountPage> createState() => _findAccountPageState();
}

class _findAccountPageState extends State<findAccountPage> {

  final formKeyFindAccount = GlobalKey<FormState>();

  String? email;

  @override
  Widget build(BuildContext context) {
  Get.put(SignInformationController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoideBottomInset 키보드 넘침 방지
        appBar: AppBar(
          title: Text("findAccountPage"),
          automaticallyImplyLeading: false,
          // automaticallyImplyLeading 뒤로가기 버튼 비활성화하기
        ),
        body: Center(child: Form(
          key:  this.formKeyFindAccount,
          child: Column(
            children: <Widget>[
              signUpTextFormFieldEmail(onSaved: emailSet , label: '이메일',validator: emailValidator),
              findAccountCheckButton(formKey2: formKeyFindAccount),
              homeButton(callfrom: 'findAccount'),
            ],
          ),
        ),)
      
    );
  }
  void emailSet(val) {
    setState(() {
      this.email = val;
      Get.find<SignInformationController>().assignTempEmail(email!);
    });
  }
 
    String? emailValidator(val) {
    if (val.length < 1) {
      return ' 이메일 입력바람';
    }
    if (!emailExp.hasMatch(val)) {
      return '잘못된 이메일 형식입니다.';
    }
    return null;
  }

}