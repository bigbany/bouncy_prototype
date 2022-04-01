import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_bouncy/controller/signUpInformationGetxController.dart';
import 'package:get/get.dart';
import 'components/homeButton.dart';
import 'components/signUpCheckButton.dart';
import 'components/signUpTextFormField.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final formKey = GlobalKey<FormState>();
// form 을 사용하기 위해서 formkey 를 설정한다 .

  // final _emailFocusNode = FocusNode();
  // final _passwordFocusNode = FocusNode();
  // final _passwordCheckFocusNode = FocusNode();

  String? email;
  String? temp_password;
  String? password;
  bool obscureToggle = true;
  // obscureToggle 비밀번호 여부를 확인하기 위한 booll

  @override
  void initState() {
    // _emailFocusNode.addListener(checkEmailFirebaseUser);
    super.initState();
  }

  @override
  void dispose() {
    print("dispose");
    // _emailFocusNode.removeListener(checkEmailFirebaseUser);
    // _emailFocusNode.dispose();
    // _passwordFocusNode.dispose();
    // _passwordCheckFocusNode.dispose();
    Get.delete<SignUpInformationController>();
    super.dispose();
  }

  // void checkEmailFirebaseUser() {
  //   if (!_emailFocusNode.hasFocus) {
  //     setState(() {
  //       formKey.currentState!.validate();

  //       print('firebase에서 사용된 email 인지 확인합니다.');
  //     });
  //   }
  // }
// email의 focus node 가 꺼졌을때 실행 시키는 메소드

// 회원가입 페이지
  @override
  Widget build(BuildContext context) {
    print('formKey 1의 값은 ${formKey}');

    Get.put(SignUpInformationController());
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
            child: Column(children: [
              SizedBox(height: 30),
              signUpTextFormField(
                label: '이메일',
                obscureOption: null,
                textInputAction: TextInputAction.next,
                onTapIconButton: () {},
                onSaved: (val) {
                  setState(() {
                    this.email = val;
                    Get.find<SignUpInformationController>().assignEmail(email!);
                  });
                },
                validator: (val) {
                  if (val.length < 1) {
                    return ' 이메일 입력바람';
                  }
                  if (!RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(val)) {
                    return '잘못된 이메일 형식입니다.';
                  }
                  return null;
                },
              ),
              signUpTextFormField(
                label: '비밀번호',
                obscureOption: obscureToggle,
                onTapIconButton: () {
                  setState(() {
                    obscureToggle = !obscureToggle;
                  });
                },
                textInputAction: TextInputAction.next,
                onSaved: (val) {
                  obscureToggle = !obscureToggle;
                },
                validator: (val) {
                  if (val.length < 1) {
                    return '비밀번호는 필수사항입니다.';
                  }
                  if (!RegExp(
                          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$')
                      .hasMatch(val)) {
                    return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요..';
                  } else {
                    this.temp_password = val;
                    print("temp_password는 ${temp_password}");
                  }
                  return null;
                },
              ),
              signUpTextFormField(
                label: '비밀번호 확인',
                obscureOption: obscureToggle,
                onTapIconButton: () {
                  setState(() {
                    obscureToggle = !obscureToggle;
                  });
                },
                textInputAction: TextInputAction.done,
                onSaved: (val) {
                  setState(() {
                    this.password = val;
                    Get.find<SignUpInformationController>()
                        .assignPassword(password!);
                  });
                },
                validator: (val) {
                  if (temp_password == null) {
                    return '비밀번호를 먼저 입력하세요';
                  }

                  if (val != temp_password) {
                    return '입력한 비밀번호와 다릅니다.';
                  }
                },
              ),
              signUpCheckButton(
                formKey2: formKey,
              ),
              Text("state: ${stateCode ?? 'basic route'} "),
              homeButton(callfrom: "signUpPage")
            ]),
          ),
        ));
  }
}
