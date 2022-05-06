import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/style/signUpTextFormFieldDecoration.dart';
import 'package:flutter_application_bouncy/style/style.dart';
import 'package:path/path.dart';
signUpTextFormFieldEmail({
  // signUpTextFormField로 만든다.
  
  required FormFieldSetter? onSaved,
  required FormFieldValidator? validator,
  required String? label
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
             autofocus: true,
             showCursor: false,
             decoration: signUpTextFormFieldDecorationEmail(label!),
             onSaved: onSaved,
             validator: validator,
             autovalidateMode: AutovalidateMode.onUserInteraction,
             textInputAction: TextInputAction.next,
               keyboardType: TextInputType.emailAddress,
           ),
  );
}


