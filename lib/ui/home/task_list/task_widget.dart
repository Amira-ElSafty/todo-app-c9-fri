import 'package:flutter/material.dart';
import 'package:flutter_app_todo_c9_fri/firebase_utils.dart';
import 'package:flutter_app_todo_c9_fri/model/task.dart';
import 'package:flutter_app_todo_c9_fri/my_theme.dart';
import 'package:flutter_app_todo_c9_fri/providers/auth_provider.dart';
import 'package:flutter_app_todo_c9_fri/providers/list_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  Task task;
  TaskWidget({required this.task});
  @override
  Widget build(BuildContext context) {
    var listProvider = Provider.of<ListProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15)
              ),
              onPressed: (context) {
                /// delete task
                 var authProvider = Provider.of<AuthProvider>(context,listen: false);
                FirebaseUtils.deleteTaskFromFireStore(task,authProvider.currentUser?.id??'').timeout(
                  Duration(milliseconds: 500),
                  onTimeout: (){
                    print('task was deleted');
                    listProvider.getAllTasksFromFireStore(authProvider.currentUser?.id??'');
                  }
                );
              },
              backgroundColor: MyTheme.redColor,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: MyTheme.whiteColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 4,
                height: 80,
                color: Theme.of(context).primaryColor,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      task.title ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(task.description ?? '',
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ],
              )),
              Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 21),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Theme.of(context).primaryColor),
                child: Icon(Icons.check, color: MyTheme.whiteColor, size: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
