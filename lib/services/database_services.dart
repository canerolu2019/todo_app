import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo.dart';

class DatabaseService{
  CollectionReference todosCollection =
   FirebaseFirestore.instance.collection("Todos");

Future createNewTodo(String title) async {
 return await todosCollection.add({
   "title": title,
   "isComplet":false,
 });
  } 
Future completTask(uid) async{
await todosCollection.doc(uid).update({"isComplet": true});
} 

List<Todo>todoFromFirestore(QuerySnapshot snapshot) {
  if(snapshot != null) {
 return snapshot.docs.map((e) {
     data = e.data()["title"];
         = e.data()["isComplet"];
                var isComple;
                return Todo(
                isComplet: isComplet, 
        title: data,
    uid: e.id);
    });
  }
}

Stream<Todo> listTodos() {
}

}