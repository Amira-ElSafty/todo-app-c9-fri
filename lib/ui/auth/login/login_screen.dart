import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/components/custom_text_form_field.dart';
import 'package:flutter_app_todo_c9_fri/dialog_utils.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_navigator.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_screen_view_model.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/register/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginNavigator {
  LoginScreenViewModel viewModel = LoginScreenViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset(
              'assets/images/main_background.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Form(
              key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                    CustomTextFormField(
                      label: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                      controller: viewModel.emailController,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter email address';
                        }
                        bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if (!emailValid) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    CustomTextFormField(
                      label: 'Password',
                      keyboardType: TextInputType.number,
                      controller: viewModel.passwordController,
                      isPassword: true,
                      validator: (text) {
                        if (text == null || text.trim().isEmpty) {
                          return 'Please enter Password';
                        }
                        if (text.length < 6) {
                          return 'Password should be at least 6 chars';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12)),
                          onPressed: () {
                            viewModel.login();
                          },
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.titleLarge,
                          )),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                            onPressed: () {
                              /// navigate to login
                              Navigator.of(context)
                                  .pushNamed(RegisterScreen.routeName);
                            },
                            child: Text(
                              'SignUp',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void hideMyLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void showMyLoading() {
    DialogUtils.showLoading(context, 'Loading...');
  }

  @override
  void showMyMessage(String message) {
    DialogUtils.showMessage(context, message, posActionName: 'Ok');
  }
}
