import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/my_theme.dart';
import 'package:flutter_app_todo_c9_fri/providers/list_provider.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/register/register_screen.dart';
import 'package:flutter_app_todo_c9_fri/ui/home/home_screen.dart';
import 'package:provider/provider.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  runApp(ChangeNotifierProvider(
    create: (context) => ListProvider(),
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RegisterScreen.routeName,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
        LoginScreen.routeName : (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
      },
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
    );
  }
}
