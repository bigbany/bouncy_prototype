import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_bouncy/controller/signUpInformationGetxController.dart';
import 'package:get/get.dart';

import 'components/homeButton.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  final _formKey = GlobalKey<FormState>();
// form 을 사용하기 위해서 formkey 를 설정한다 .

String? email;
String? password;

@override
void dispose(){
  print("dispose");
  Get.delete<SignUpInformationController>();
  super.dispose();
}

// 회원가입 페이지
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpInformationController());
    //put getx controller for gain sign up information
    //회원가입 정보를 모으기 위해 controller를 연다 
    // 궁금한거 controller를 다른 페이지에서도 사용할 수 있는지?
    String? stateCode = Get.arguments;
    // argument를 받는 부분
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("signUpPage"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Form(
            key: this._formKey,
            // Center 위젯 안에 Form 위젯으로 감싼다. 이 안에서는 form을 이용할 수 있다.
            child: Column(children: [
              // renderTextFormField(
              //     label: '이름',
              //     type: '',
              //     onSaved: (val) {},
              //     validator: (val) {
              //       return null;
              //     }),
              renderTextFormField(
                label: '이메일',
                onSaved: (val) {
                  setState((){
                    this.email= val;
                  });
                },
                validator: (val) {
                  return null;
                },
              ),
              renderTextFormField(
                label: '비밀번호',
                onSaved: (val) {
                  setState((){
                    this.password= val;
                  });
                },
                validator: (val) {
                  return null;
                },
              ),
              renderTextFormField(
                label: '비밀번호 확인',
                onSaved: (val) {},
                validator: (val) {
                  return null;
                },
              ),
              renderButton(),
              Text("state: ${stateCode ?? 'basic route'} "),
              homeButton(callfrom: "signUpPage")
            ]),
          ),
        ));
  }

  renderButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.green),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            //formfield의 입력값을 분배하는거

             Get.find<SignUpInformationController>().assignEmailAndPassword(email!,password!);
            Get.snackbar('저장완료!', '폼 저장이 완료되었습니다!');
            Get.toNamed("/signUpPage_2");
          }

        },
        child: Text('저장하기!', style: TextStyle(color: Colors.white)));
  }
}

renderTextFormField(
    {
    // renderTextFormField로 만든다.
    required String? label,
    required FormFieldSetter? onSaved,
    required FormFieldValidator? validator,
  }) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            label!,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      TextFormField(
        autofocus: true,
        // autofocus 페이지로 들어오자마자 활성화하기
        onSaved: onSaved,
        validator: validator,
        obscureText: label == '비밀번호' ? true : false,
        textInputAction: TextInputAction.next,
        keyboardType: label == '체중' ? TextInputType.number : TextInputType.text
      ),
      Container(height: 16.0)
    ],
  );
}
