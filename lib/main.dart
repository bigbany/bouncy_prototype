import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/Screen/nfcPage.dart';
import 'package:flutter_application_bouncy/VerifyEmailPage.dart';
import 'package:flutter_application_bouncy/findAccountPage.dart';
import 'package:flutter_application_bouncy/mainPage.dart';
import 'package:flutter_application_bouncy/signInPage.dart';
import 'package:flutter_application_bouncy/signUpPage.dart';
import 'package:flutter_application_bouncy/loggedPage.dart';
import 'package:flutter_application_bouncy/style/materialColorInstance.dart';
import 'package:flutter_application_bouncy/style/style.dart';
import 'package:flutter_application_bouncy/toolAndWorkerPage.dart';
import 'package:get/get.dart';
import 'unSignedPage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
// 최초의 위젯 진입점

// 함수는 소문자로 위젯은 대문자로 시작
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

        // GetMaterialApp 으로 덮는다.
        title: 'Bouncy',
        theme: ThemeData(primarySwatch: createMaterialColor(blue_500)),
        // home: UnSignedPage(),
        initialRoute: "/",
        getPages: [
          GetPage(
              name: "/",
              page: () => MainPage(),
              transition: Transition.noTransition),
          GetPage(
              name: "/unsignedPage",
              page: () => UnSignedPage(),
              transition: Transition.noTransition),
          GetPage(
              name: "/loggedPage",
              page: () => loggedPage(),
              transition: Transition.noTransition,
              popGesture: true),
          GetPage(
              name: '/VerifyEmailPage',
              page: () => VerifyEmailPage(),
              transition: Transition.noTransition,
              popGesture: true),
          GetPage(
              name: "/signInPage",
              page: () => signInPage(),
              transition: Transition.noTransition,
              popGesture: true),
          GetPage(
              name: "/signUpPage",
              page: () => signUpPage(),
              transition: Transition.noTransition,
              popGesture: true),
          GetPage(
              name: "/findAccountPage",
              page: () => findAccountPage(),
              transition: Transition.noTransition,
              popGesture: true),
  GetPage(
              name: "/toolAndWorkerPage",
              page: () => ToolAndWorker(),
              transition: Transition.noTransition,
              popGesture: true),
                GetPage(
              name: "/nfcTestPage",
              page: () => NFCTEST(),
              transition: Transition.noTransition,
              popGesture: true),
        ]);
  }
}
