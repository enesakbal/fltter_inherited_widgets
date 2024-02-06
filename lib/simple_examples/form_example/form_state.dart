import 'package:fltter_inherited_widgets/simple_examples/form_example/user_model.dart';
import 'package:flutter/material.dart';

class CustomFormState extends InheritedWidget {
  CustomFormState({
    super.key,
    required super.child,
    required this.setUserModel,
    required this.userModel,
  });

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final UserModel? userModel;

  final void Function(UserModel model) setUserModel;

  static CustomFormState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CustomFormState>()!;
  }

  @override
  bool updateShouldNotify(covariant CustomFormState oldWidget) {
    return oldWidget.userModel != userModel;
  }
}
