import 'dart:developer';

import 'package:fltter_inherited_widgets/simple_examples/form_example/user_model.dart';
import 'package:flutter/material.dart';

class CustomFormState extends InheritedWidget {
  CustomFormState({
    super.key,
    required super.child,
    required this.userModel,
  })  : nameController = TextEditingController(text: '${userModel.name}'),
        emailController = TextEditingController(text: '${userModel.email}'),
        passwordController = TextEditingController(text: '${userModel.password}');

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserModel userModel;

  static CustomFormState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomFormState>()!;
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void setUserModel({
    String? name,
    String? email,
    String? password,
  }) {
    userModel.copyWith(
      name: name,
      email: email,
      password: password,
    );
  }

  @override
  bool updateShouldNotify(covariant CustomFormState oldWidget) {
    log('messageqweqwe');
    return oldWidget.userModel != userModel;
  }
}
