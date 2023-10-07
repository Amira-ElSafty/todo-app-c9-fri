import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/my_theme.dart';
import 'package:flutter_app_todo_c9_fri/providers/auth_provider.dart';
import 'package:flutter_app_todo_c9_fri/providers/list_provider.dart';
import 'package:flutter_app_todo_c9_fri/ui/auth/login/login_screen.dart';
import 'package:flutter_app_todo_c9_fri/ui/home/task_list/add_task_bottom_sheet.dart';
import 'package:flutter_app_todo_c9_fri/ui/home/settings/settings_widget.dart';
import 'package:flutter_app_todo_c9_fri/ui/home/task_list/task_list_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0 ;

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context,listen: false);
     // var listProvider = Provider.of<ListProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedIndex==0 ? 'ToDo List  ''${authProvider.currentUser!.name}':'Settings '
              '${authProvider.currentUser!.name}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          IconButton(onPressed: (){
           //  listProvider.tasksList = [];
           // authProvider.currentUser = null ;
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          }, icon: Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index){
            selectedIndex = index ;
            setState(() {

            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
              label: 'Task-List'
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings'
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          /// add task
          showAddBottomSheet();
        },
        child: Icon(Icons.add,size: 30),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: MyTheme.whiteColor,
            width: 4
          ),
          borderRadius: BorderRadius.circular(30)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex] ,
    );
  }
  List<Widget> tabs = [
    TaskListWidget(),SettingsWidget()
  ];

  void showAddBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) => AddTaskBottomSheet()
    );
  }
}
