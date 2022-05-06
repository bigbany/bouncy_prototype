import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/style/signUpTextFormFieldDecoration.dart';

signInTextFormFieldEmail({
  // signUpTextFormField로 만든다.
  
  required FormFieldSetter? onSaved,
  required String? label
}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
             autofocus: true,
             showCursor: false,
             decoration: signUpTextFormFieldDecorationEmail(label!),
             onSaved: onSaved,
             textInputAction: TextInputAction.next,
             keyboardType: TextInputType.emailAddress,
           ),
  );
}