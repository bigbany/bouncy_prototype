import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_bouncy/RegExp/regExp.dart';
import 'package:flutter_application_bouncy/components/signUpTextFormFieldEmail.dart';
import 'package:flutter_application_bouncy/components/signUpTextFormFieldPassword.dart';
import 'package:flutter_application_bouncy/controller/signInformationGetxController.dart';
import 'package:get/get.dart';
import 'components/homeButton.dart';
import 'components/signUpCheckButton.dart';
import 'components/signUpTextFormField.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => signUpPageState();
}

class signUpPageState extends State<signUpPage> {
  final authenticationSignUp = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();

  String? email;
  String? temp_password;
  String? password;
  bool obscureToggle = true;
  // obscureToggle 비밀번호 여부를 확인하기 위한 booll

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    Get.delete<SignInformationController>();
    super.dispose();
  }

// 회원가입 페이지
  @override
  Widget build(BuildContext context) {
    print('formKey 1의 값은 ${formKey}');
    Get.put(SignInformationController());
    //put getx controller for gain sign up information
    //회원가입 정보를 모으기 위해 controller를 연다
    // 궁금한거 controller를 다른 페이지에서도 사용할 수 있는지? => get off 하지 않는한. 다른 페이지에서도 유지된다.
    String? stateCode = Get.arguments;
    // argument를 받는 부분
    return Scaffold(
        resizeToAvoidBottomInset: false,
        // resizeToAvoideBottomInset 키보드 넘침 방지
        appBar: AppBar(
          title: Text("signUpPage"),
          automaticallyImplyLeading: false,
          // automaticallyImplyLeading 뒤로가기 버튼 비활성화하기
        ),
        body: Center(
          child: Form(
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            key: this.formKey,
            // Center 위젯 안에 Form 위젯으로 감싼다. 이 안에서는 form을 이용할 수 있다.
            child: Column(children: <Widget>[
              signUpTextFormFieldEmail(
                label: '이메일',
                onSaved: emailSet,
                validator: emailValidator,
              ),
              signUpTextFormFieldPassword(
                label: '비밀번호',
                obscureOption: obscureToggle,
                textInputAction: TextInputAction.next,
                onTapIconButton: obscureToggleSwitch,
                onSaved: (val) {},
                validator: passwordValidator,
              ),
              signUpTextFormFieldPassword(
                label: '비밀번호 확인',
                obscureOption: obscureToggle,
                textInputAction: TextInputAction.done,
                onTapIconButton: obscureToggleSwitch,
                onSaved: passwordSet,
                validator: passwordCheckValidator,
              ),
              signUpCheckButton(
                formKey2: formKey,
                firebaseAuthInstanceSignUp:authenticationSignUp
              ),
              Text("state: ${stateCode ?? 'basic route'} "),
              homeButton(callfrom: "signUpPage")
            ]),
          ),
        ));
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

  void emailSet(val) {
    setState(() {
      this.email = val;
      Get.find<SignInformationController>().assignEmail(email!);
    });
  }

  String? passwordValidator(val) {
    if (!passwordExp.hasMatch(val)) {
      return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요..';
    } else {
      this.temp_password = val;
      print("temp_password는 ${temp_password}");
    }
    return null;
  }

  void passwordSet(val) {
    setState(() {
      this.password = val;
      Get.find<SignInformationController>().assignPassword(password!);
    });
  }

  String? passwordCheckValidator(val) {
    if (temp_password == null) {
      return '비밀번호를 먼저 입력하세요';
    }
    if (val != temp_password) {
      return '입력한 비밀번호와 다릅니다.';
    }
  }

  void obscureToggleSwitch() {
    setState(() {
      obscureToggle = !obscureToggle;
    });
  }
}
