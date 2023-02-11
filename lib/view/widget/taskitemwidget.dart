import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskapp39/model/task_model.dart';

Widget Tasks (TaskModel taskModel){
  return Container(
    height: 100,
    width: 150,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.teal
    ),
    child: ListTile(
      trailing: Text(taskModel.time) ,
      title: CircleAvatar(
        radius: 10,
        child: Text(taskModel.title),
      ) ,
      subtitle: Text(taskModel.date) ,
    ),
  );
}