import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/components/signInCheckButton.dart';
import 'package:flutter_application_bouncy/components/signInTextFormFieldEmail.dart';
import 'package:flutter_application_bouncy/components/signInTextFormFieldPassword.dart';
import 'package:flutter_application_bouncy/components/signUpTextFormFieldEmail.dart';
import 'package:flutter_application_bouncy/components/signUpTextFormFieldPassword.dart';
import 'package:flutter_application_bouncy/controller/signInformationGetxController.dart';
import 'package:get/get.dart';

import 'components/homeButton.dart';

class signInPage extends StatefulWidget {
  const signInPage({Key? key}) : super(key: key);

  @override
  State<signInPage> createState() => _signInPageState();
}

class _signInPageState extends State<signInPage> {
   final authenticationSignIn = FirebaseAuth.instance;
  final formKeySignIn = GlobalKey<FormState>();
  String? email;
  String? password;
  bool obscureToggle = true;

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

  @override
  Widget build(BuildContext context) {
    Get.put(SignInformationController());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("signInPage"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Form(
            key:  this.formKeySignIn,
            child: Column(children: [
              signInTextFormFieldEmail(label: '이메일',onSaved: emailSet, ),
              signInTextFormFieldPassword(label: '비밀번호',onSaved: passwordSet,obscureOption: obscureToggle,onTapIconButton: obscureToggleSwitch),
              signInCheckButton(formKey2: formKeySignIn,firebaseAuthInstanceSignIn: authenticationSignIn,),
              ElevatedButton(onPressed: (){
                Get.offNamed("/findAccountPage");
              }, child: Text('비밀번호 찾기')),

              ElevatedButton(
                  onPressed: () {
                    Get.offNamed("/signUpPage", arguments: "from signIn");
                  },
                  child: Text("goto sign up")),
              homeButton(callfrom: "signInPage")
            ]),
          ),
        ));
  }

 void emailSet(val) {
    setState(() {
      this.email = val;
      Get.find<SignInformationController>().assignEmailSignIn(email!);
    });
  }

  void passwordSet(val) {
    setState(() {
      this.password = val;
      Get.find<SignInformationController>().assignPasswordSignIn(password!);
    });
  }
  
   void obscureToggleSwitch() {
    setState(() {
      obscureToggle = !obscureToggle;
    });
  }
}
