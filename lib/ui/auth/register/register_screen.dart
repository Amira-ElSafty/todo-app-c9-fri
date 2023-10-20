import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/components/custom_text_form_field.dart';
import 'package:flutter_app_todo_c9_fri/dialog_utils.dart';
import 'package:flutter_app_todo_c9_fri/firebase_utils.dart';
import 'package:flutter_app_todo_c9_fri/model/my_user.dart';
import 'package:flutter_app_todo_c9_fri/providers/auth_provider.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/register/register_navigator.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/register/register_screen_view_model.dart';
import 'package:flutter_app_todo_c9_fri/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> implements RegisterNavigator {
  var nameController = TextEditingController(text: 'Amira');

  var emailController = TextEditingController(text: 'amira@route.com');

  var passwordController = TextEditingController(text: '123456');

  var confirmPasswordController = TextEditingController(text: '123456');

  var formKey = GlobalKey<FormState>();

  RegisterScreenViewModel viewModel = RegisterScreenViewModel();

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
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.4),
                    CustomTextFormField(label: 'User Name',
                    controller: nameController,
                      validator: (text){
                      if(text == null || text.trim().isEmpty){
                        return 'Please enter userName';
                      }
                      return null ;
                      },
                    ),
                    CustomTextFormField(label: 'Email Address',
                      keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter email address';
                        }
                        bool emailValid =
                        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(text);
                        if(!emailValid){
                          return 'Please enter a valid email';
                        }
                        return null ;
                      },
                    ),
                    CustomTextFormField(label: 'Password',
                      keyboardType: TextInputType.number,
                        controller: passwordController,
                      isPassword: true,
                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter Password';
                        }
                        if(text.length < 6){
                          return 'Password should be at least 6 chars';
                        }
                        return null ;
                      },
                    ),
                    CustomTextFormField(label: 'Confirm Password',
                      keyboardType: TextInputType.number,
                        controller: confirmPasswordController,
                      isPassword: true,

                      validator: (text){
                        if(text == null || text.trim().isEmpty){
                          return 'Please enter ConfirmPassword';
                        }
                        if(text != passwordController.text){
                          return "Password doesn't match";
                        }
                        return null ;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12)
                        ),
                          onPressed: (){
                        register();
                      }, child: Text('Register',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                      ),
                    ),
                    TextButton(onPressed: (){
                      /// navigate to login
                      Navigator.of(context).pushNamed(LoginScreen.routeName);
                    }, child: Text('Already Exist!',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold
                      ),

                    ))

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register() async{
    if(formKey.currentState?.validate()== true){
      viewModel.register(emailController.text, passwordController.text);
    }
  }

  @override
  void hideMyLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void showMessage(String message) {
  DialogUtils.showMessage(context, message,posActionName: 'Ok');
  }

  @override
  void showMyLoading() {
   DialogUtils.showLoading(context,'Loading...');
  }
}
