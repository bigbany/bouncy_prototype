import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/components/homeButton.dart';
import 'package:flutter_application_bouncy/components/logOutButton.dart';
import 'package:flutter_application_bouncy/loggedPage.dart';
import 'package:get/get.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({Key? key}) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  bool canResendEmail = false;
  bool isEmailVerified = false;
  Timer? timer;

  @override
  void initState() {
    isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

    if (!isEmailVerified) {
      sendVerificationEmail();

      timer = Timer.periodic(
        Duration(seconds: 5),
        (_) => checkEmailVerified(),
      );
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();

    setState(() {
      isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Future sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser!;
      await user.sendEmailVerification();

      setState(() {
        canResendEmail = false;
      });
      await Future.delayed(Duration(seconds: 5));
      setState(() {
        canResendEmail = true;
      });
    } catch (e) {
      Get.snackbar('이메일 전송오류!', '다시 입력해주세요');
    }
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? loggedPage()
      : Scaffold(
          appBar: AppBar(
            title: Text('verify Email'),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: <Widget>[
              homeButton(callfrom: 'verifyEmail'),
              Text(
                'A verification email has been sent to your email',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  icon: Icon(Icons.email, size: 32),
                  label: Text(
                    'Resent Email',
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed:canResendEmail? sendVerificationEmail: null),
                  TextButton(
                    style:ElevatedButton.styleFrom(
                      maximumSize: Size.fromHeight(50),
                    ),
                    child: Text('Cancel',
                    style: TextStyle(fontSize:24 )),
                    onPressed: ()=> FirebaseAuth.instance.signOut(),
                    )
            ]),
          ),
        );
}
