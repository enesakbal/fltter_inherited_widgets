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
  late UserModel userModel;

  @override
  void initState() {
    userModel = UserModel();
    super.initState();
  }

  setUserModel(UserModel newUserModel) {
    setState(() {
      userModel = newUserModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomFormState(
      setUserModel: setUserModel,
      userModel: userModel,
      child: widget.child,
    );
  }
}
