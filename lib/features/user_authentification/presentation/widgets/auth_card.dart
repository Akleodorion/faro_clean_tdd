import 'dart:math';

import 'package:faro_clean_tdd/core/util/size_info.dart';
import 'package:faro_clean_tdd/features/user_authentification/presentation/widgets/constants/constants.dart';

import '../../../../core/util/text_field_enum.dart';
import '../providers/user_provider.dart';
import 'my_text_button.dart';
import 'my_text_form_field.dart';
import 'remember_checkbox.dart';
import 'usecase_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/state/user_state.dart';

class AuthCard extends ConsumerStatefulWidget {
  const AuthCard({super.key});

  @override
  ConsumerState<AuthCard> createState() => _AuthCardState();
}

class _AuthCardState extends ConsumerState<AuthCard> {
  bool logingIn = true;

  String? _enteredEmail;
  String? _enteredPassword;
  String? _enteredUsername;
  String? _enteredPhoneNumber;
  bool? _isChecked;
  GlobalKey<FormState>? _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    final values = ref.read(userAuthProvider);
    if (values is Initial) {
      _enteredEmail = values.userInfo["email"];
      _enteredPassword = values.userInfo["password"];
      _isChecked = values.userInfo["pref"];
    }
  }

  _userLogin() async {
    if (_formKey!.currentState!.validate()) {
      _formKey!.currentState!.save();
      final currentState = ref.read(userAuthProvider);

      if (currentState is Initial) {
        _isChecked = currentState.userInfo["pref"];
      }
      final state = await ref
          .read(userAuthProvider.notifier)
          .logUserIn(_enteredEmail!, _enteredPassword!, _isChecked!);

      if (state is Error && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          content: Text(
            state.message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ));
      }
    }
  }

  void _userSignIn() async {
    if (_formKey!.currentState!.validate()) {
      _formKey!.currentState!.save();
      final state = await ref.read(userAuthProvider.notifier).signUserIn(
            _enteredEmail!,
            _enteredPassword!,
            _enteredPhoneNumber!,
            _enteredUsername!,
            _isChecked!,
          );
      if (state is Error && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          content: Text(
            state.message,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPadding = getGlobalPadding();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              boxShadow: kElevationToShadow[3],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Column(
                        children: [
                          MyTextFormField(
                              key: ValueKey(Random()),
                              label: 'email',
                              intialValue: _enteredEmail ?? '',
                              onSaved: (value) {
                                setState(() {
                                  _enteredEmail = value;
                                });
                              },
                              type: TextFieldType.email),
                          const SizedBox(
                            height: 10,
                          ),
                          MyTextFormField(
                              key: ValueKey(Random()),
                              label: Strings.password,
                              intialValue: _enteredPassword ?? '',
                              onSaved: (value) {
                                setState(() {
                                  _enteredPassword = value;
                                });
                              },
                              type: TextFieldType.password),
                          const SizedBox(
                            height: 10,
                          ),
                          if (!logingIn)
                            MyTextFormField(
                                key: ValueKey(Random()),
                                label: Strings.userName,
                                intialValue: _enteredUsername ?? '',
                                onSaved: (value) {
                                  setState(() {
                                    _enteredUsername = value;
                                  });
                                },
                                type: TextFieldType.text),
                          if (!logingIn)
                            const SizedBox(
                              height: 10,
                            ),
                          if (!logingIn)
                            MyTextFormField(
                                key: ValueKey(Random()),
                                label: Strings.phoneNumber,
                                intialValue: _enteredPhoneNumber ?? '',
                                onSaved: (value) {
                                  setState(() {
                                    _enteredPhoneNumber = value;
                                  });
                                },
                                type: TextFieldType.number),
                          if (!logingIn)
                            const SizedBox(
                              height: 10,
                            ),
                          const RememberCheckbox(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        UsecaseElevatedButton(
                          usecaseTitle:
                              logingIn ? Strings.logIn : Strings.signIn,
                          onUsecaseCall: logingIn ? _userLogin : _userSignIn,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        MyTextButton(
                            text: logingIn
                                ? Strings.createAccount
                                : Strings.haveAccount,
                            onPressed: () {
                              setState(() {
                                logingIn = !logingIn;
                              });
                            })
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  double getGlobalPadding() {
    final bool isScreenSizeMini = SizeInfo(context: context).isScreenSizeMini();
    final bool isScreenSizeStandard =
        SizeInfo(context: context).isScreenSizeStandard();

    if (isScreenSizeMini) {
      return 20;
    } else if (isScreenSizeStandard) {
      return 35;
    } else {
      return 45;
    }
  }
}
