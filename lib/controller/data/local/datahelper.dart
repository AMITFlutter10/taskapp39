import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taskapp39/model/task_model.dart';

// BD=> table
// sql => DB

// 1-SQFLTE
// 2-MOOR/DRFIT
// 3-FLOOR
// 4-HAVIE

//CRUD

class DataHelper{
  late Database  database ;
//   static Future<String>getPath()async{
//    var dataPath= await getDatabasesPath();
//    String path = join(dataPath, 'task.db');
//    print(path);
//      return path;
//  }
//  // late TaskModel taskModel;
// Future<void> createDb() async{
//  database= await openDatabase(getPath().toString(),version:1,
//    //create table only once
//    onCreate: (Database db, int version) async {
//     await db.execute(
//          'CREATE TABLE Tasks (id INTEGER PRIMARY KEY,'
//              'title TEXT, time TEXT, date TEXT )').then((value) =>
//          print("table created")).catchError((error)=>
//         print("error when create table $error"));
//    },
//      // onOpen: (){}
//    );
// }

  Future<void> createDb() async{
    var dataPath= await getDatabasesPath();
   String path = join(dataPath, 'task.db');
   print(path);
   // /data/user/0/com.example.taskapp39/databases/task.db
  database= await openDatabase(path,version:1,
   //create table only once
   onCreate: (db, int version) async {
    await db.execute(
         'CREATE TABLE Tasks (id INTEGER PRIMARY KEY,'
             'title TEXT, time TEXT, date TEXT )').
    then((value) =>
         print("table created")).catchError((error)=>
        print("error when create table $error"));
   },
      // onOpen: (dp){
      //   getDatabase();
      // }
   );
}

Future<void>insertDb(TaskModel taskModel)async {
  await database.transaction((txn) async {
    await txn.rawInsert('INSERT INTO Tasks(title, time,'
        ' date ) '
        'VALUES("${taskModel.title}", "${taskModel.time}"'
        ',"${taskModel
        .date}")')
        .then((value){
        print("insert successfully $value");
        getDatabase();
        }).catchError((onError) {
      print("error when insert row record "
          "${onError.toString()}");
    });
  });
}
// List donetasks=[];
// List deletetasks=[];
 static List tasksItem =[];
 getDatabase()async{
   // tasksItem.clear();
   await database.rawQuery('SELECT * FROM Tasks').
   then((value){
     print(value);
     value.forEach((element) {tasksItem.add(TaskModel.fromMap(element));
     // value.forEach((element) {
     //   if(element["statues"]=="done"){
     //     donetasks.add(TaskModel.fromMap(element));
     //   }
     //   else {
     //     if(element["statues"]=="delete"){
     //       deletetasks.add(TaskModel.fromMap(element));
     //     }
     //   }

     });
   }).catchError((error)=>print("error$error"));
 }

 void update ({required int id ,
   required String coulmnName,
   required String valueupdated,
 })async
 {
   await database.rawUpdate('UPDATE Tasks SET '
       '$coulmnName = ? WHERE $id = ?',
   ["$valueupdated",]);
 }
 
 delete(int id)async {
   await database.
   rawDelete('DELETE FROM Tasks WHERE id = ?',["$id"]);
}
 
 }
