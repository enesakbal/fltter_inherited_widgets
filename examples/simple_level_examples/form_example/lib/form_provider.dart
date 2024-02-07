import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:form_example/form_state.dart';
import 'package:form_example/user_model.dart';

class FormProvider extends StatefulWidget {
  const FormProvider({super.key, required this.child});

  final Widget child;

  @override
  State<FormProvider> createState() => _FormProviderState();
}

class _FormProviderState extends State<FormProvider> {
  late UserModel userModel;

  @override
  void initState() {
    userModel = UserModel();
    super.initState();
  }

  void setUser(UserModel newUserModel) {
    setState(() {
      userModel = userModel.copyWith(
        password: newUserModel.password,
        email: newUserModel.email,
        name: newUserModel.name,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    log('called FormProvider build');
    return CustomFormState(
      userModel: userModel,
      setUser: setUser,
      child: widget.child,
    );
  }
}
