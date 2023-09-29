import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/components/custom_text_form_field.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'register';
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  void register() {
    if(formKey.currentState?.validate()== true){
      /// register
    }
  }
}
