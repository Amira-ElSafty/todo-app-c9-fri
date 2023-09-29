import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_todo_c9_fri/model/task.dart';

class FirebaseUtils{

  static CollectionReference<Task> getTasksCollection(){
    return  FirebaseFirestore.instance.collection(Task.collectionName).
    withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!),
        toFirestore: (task,options) => task.toFireStore()
    );
  }

  static Future<void> addTaskToFireStore(Task task ){
    var taskCollection = getTasksCollection();  /// collection
    var docRef = taskCollection.doc();  /// document
    task.id = docRef.id; /// auto id
    return docRef.set(task);
  }

  static Future<void> deleteTaskFromFireStore(Task task){
    return getTasksCollection().doc(task.id).delete();
  }
}
