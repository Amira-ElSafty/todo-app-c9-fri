import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/firebase_utils.dart';
import 'package:flutter_app_todo_c9_fri/model/task.dart';
import 'package:flutter_app_todo_c9_fri/my_theme.dart';
import 'package:flutter_app_todo_c9_fri/providers/auth_provider.dart';
import 'package:flutter_app_todo_c9_fri/providers/list_provider.dart';
import 'package:flutter_app_todo_c9_fri/ui/home/task_list/task_widget.dart';
import 'package:provider/provider.dart';

class TaskListWidget extends StatefulWidget {
  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {

  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    var authProvider = Provider.of<AuthProvider>(context);
    listProvider.getAllTasksFromFireStore(authProvider.currentUser?.id??"");
    return Column(
      children: [
        CalendarTimeline(
          initialDate: listProvider.selectDate,
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            listProvider.changeSelectedDate(date,authProvider.currentUser?.id??'');
          },
          leftMargin: 20,
          monthColor: MyTheme.blackColor,
          dayColor: Theme.of(context).primaryColor,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: Theme.of(context).primaryColor,
          dotsColor:MyTheme.whiteColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context,index){
              return TaskWidget(task: listProvider.tasksList[index],);
            },
            itemCount: listProvider.tasksList.length,
          ),
        ),

      ],

    );
  }

}
