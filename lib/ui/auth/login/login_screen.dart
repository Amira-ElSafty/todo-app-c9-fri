import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/components/custom_text_form_field.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/register/register_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login';
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
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
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12)
                      ),
                        onPressed: (){
                      login();
                    }, child: Text('Login',
                      style: Theme.of(context).textTheme.titleLarge,
                    )
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.2,),
                      Text("Don't have an account?",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      TextButton(onPressed: (){
                        /// navigate to login
                        Navigator.of(context).pushNamed(RegisterScreen.routeName);
                      }, child: Text('SignUp',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                        ),

                      ))

                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() {
    if(formKey.currentState?.validate()== true){
      /// register
    }
  }
}
