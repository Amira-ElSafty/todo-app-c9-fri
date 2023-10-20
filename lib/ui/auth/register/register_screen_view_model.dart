import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/register/register_navigator.dart';

/// provider
class RegisterScreenViewModel extends ChangeNotifier{
  //todo: hold data - handle logic
  late RegisterNavigator navigator ;

  void register(String email , String password)async{
    /// register
    //todo: show loading
    navigator.showMyLoading();
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // MyUser myUser = MyUser(
      //     id: credential.user?.uid??'',
      //     name: nameController.text,
      //     email: emailController.text);
      // var authProvider = Provider.of<AuthProvider>(context,listen: false);
      // authProvider.updateUser(myUser);
      // await FirebaseUtils.addUserToFireStore(myUser);
      //todo: hide loading
      navigator.hideMyLoading();
      //todo: show message
      navigator.showMessage('Register Sucuessfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        //todo: hide loading
        navigator.hideMyLoading();
        //todo: show message
        navigator.showMessage('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        //todo: hide loading
        navigator.hideMyLoading();
        //todo: show message
        navigator.showMessage('The account already exists for that email.');
      }
    } catch (e) {
      //todo: hide loading
      navigator.hideMyLoading();
      //todo: show message
      navigator.showMessage( e.toString());
    }
  }
}