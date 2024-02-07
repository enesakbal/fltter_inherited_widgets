import 'package:flutter/material.dart';
import 'package:form_example/user_model.dart';

class CustomFormState extends InheritedWidget {
  CustomFormState({
    super.key,
    required super.child,
    required this.setUser,
    required this.userModel,
  }) {
    nameController = TextEditingController(text: userModel.name);
    emailController = TextEditingController(text: userModel.email);
    passwordController = TextEditingController(text: userModel.password);
    formKey = GlobalKey<FormState>();
  }

  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  late final GlobalKey<FormState> formKey;

  final UserModel userModel;

  final ValueSetter<UserModel> setUser;

  static CustomFormState of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<CustomFormState>();
    assert(result != null, 'No CustomFormState found in context');
    return result!;
  }

  void updateUser() {
    final isValid = formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }

    setUser(
      UserModel(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  bool updateShouldNotify(covariant CustomFormState oldWidget) {
    return oldWidget.userModel != userModel;
  }
}
