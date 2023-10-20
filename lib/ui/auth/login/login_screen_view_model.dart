import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_navigator.dart';

class LoginScreenViewModel extends ChangeNotifier {
  /// hold data - handle logic
  var emailController = TextEditingController(text: 'amira10@route.com');
  var passwordController = TextEditingController(text: '123456');
  var formKey = GlobalKey<FormState>();
  late LoginNavigator navigator;

  void login() async {
    /// register
    if (formKey.currentState?.validate() == true) {
      navigator.showMyLoading();
      try {
        final credential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);

        // var user = await FirebaseUtils.readUserFromFireStore(credential.user?.uid??"");
        // if(user == null){
        //   return ;
        // }
        // var authProvider = Provider.of<AuthProvider>(context,listen: false);
        // authProvider.updateUser(user);
        //todo: hide loading
        navigator.hideMyLoading();
        //todo: show message
        navigator.showMyMessage('Login Sucuessfully');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'INVALID_LOGIN_CREDENTIALS') {
          //todo: hide loading
          navigator.hideMyLoading();
          //todo: show message
          navigator.showMyMessage(
              'No user found for that email or Wrong password provided for that use');
        }
      } catch (e) {
        //todo: hide loading
        navigator.hideMyLoading();
        //todo: show message
        navigator.showMyMessage(e.toString());
      }
    }
  }
}