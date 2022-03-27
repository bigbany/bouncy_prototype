import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/components/homeButton.dart';
import 'package:flutter_application_bouncy/controller/signUpInformationGetxController.dart';
import 'package:flutter_application_bouncy/signUpPage.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/controller/signUpInformationGetxController.dart';
import 'package:get/get.dart';

class signUpPageAdditionalInfo extends StatefulWidget {
  const signUpPageAdditionalInfo({Key? key}) : super(key: key);

  @override
  State<signUpPageAdditionalInfo> createState() =>
      _signUpPageAdditionalInfoState();
}

class _signUpPageAdditionalInfoState extends State<signUpPageAdditionalInfo> {
  final _formKey2 = GlobalKey<FormState>();
  
  double ?weight;
  double ?height;
  String ?gender;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("signUpPage_2"),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: Form(
        key: this._formKey2,
        child: Column(children: [
          renderTextFormField(label: "체중", onSaved: (val){
            setState((){
              this.weight= double.parse(val);
            });
          }, validator:(val){
            
          }, ),
          renderButton2(),

          homeButton(callfrom: 'signUpPage_2')

        ]),
      )),
    );
  }
  renderButton2(){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.green),
      onPressed: ()async{
        if(_formKey2.currentState!.validate()){
          _formKey2.currentState!.save();
        Get.find<SignUpInformationController>().assignWeightAndHeightAndGender(weight!);

        }

      }, child: Text('다음',style: TextStyle(color: Colors.white )
      ));
  }
}
