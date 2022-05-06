import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/style/signUpTextFormFieldDecoration.dart';

signInTextFormFieldPassword(
    {
    // signUpTextFormField로 만든다.

    required FormFieldSetter? onSaved,
    required bool? obscureOption,    
    required VoidCallback? onTapIconButton,
    required String? label}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      autofocus: true,
      showCursor: false,
      decoration: signUpTextFormFieldDecorationPassword(label!,obscureOption!,onTapIconButton!,),
      onSaved: onSaved,
      textInputAction: TextInputAction.done,
      obscureText: obscureOption,
    ),
  );
}
