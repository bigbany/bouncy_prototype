import 'package:flutter/material.dart';
import 'package:flutter_application_bouncy/style/signUpTextFormFieldDecoration.dart';
import 'package:flutter_application_bouncy/style/style.dart';
import 'package:path/path.dart';

signUpTextFormFieldPassword(
    {
    // signUpTextFormField로 만든다.
    required String? label,
    required FormFieldSetter? onSaved,
    required FormFieldValidator? validator,
    required TextInputAction? textInputAction,
    required VoidCallback? onTapIconButton,
    required bool? obscureOption}) {
  return Container(
    padding: const EdgeInsets.all(8),
    child: TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      showCursor: false,
      decoration: signUpTextFormFieldDecorationPassword( label!,obscureOption!, onTapIconButton! ),
      onSaved: onSaved,
      validator: validator,
      textInputAction: textInputAction,
      // 키보드 밑에  아이콘? 다음 (next): done
      obscureText: obscureOption,
    ),
  );
}
