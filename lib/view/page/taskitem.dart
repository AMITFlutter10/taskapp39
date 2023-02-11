import 'package:flutter/material.dart';
import 'package:taskapp39/controller/data/local/datahelper.dart';

import '../widget/taskitemwidget.dart';

class TaskItem extends StatefulWidget {
  String task;
  String time;
  String date;
  TaskItem(
      {Key? key, required this.time, required this.date, required this.task})
      : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  SizedBox(
                    height: 20,
                  ),
              itemCount: DataHelper.tasksItem.length,
              itemBuilder: (context, index) {
                return Tasks(DataHelper.tasksItem
                [index]);
              }),
        ),
      ),
    );
  }
}
