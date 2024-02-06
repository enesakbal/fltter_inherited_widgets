import 'package:fltter_inherited_widgets/simple_examples/form_example/form_state.dart';
import 'package:fltter_inherited_widgets/simple_examples/form_example/user_model.dart';
import 'package:flutter/material.dart';

class FormProvider extends StatefulWidget {
  const FormProvider({super.key, required this.child});

  final Widget child;

  @override
  State<FormProvider> createState() => _FormProviderState();
}

class _FormProviderState extends State<FormProvider> {
  late final UserModel userModel;

  @override
  void initState() {
    userModel = UserModel(
      name: 'John Doe',
      email: 'john@gmail.com',
      password: '123',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomFormState(
      userModel: userModel,
      child: widget.child,
    );
  }
}
