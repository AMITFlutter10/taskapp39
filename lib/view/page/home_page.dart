import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskapp39/view/page/taskitem.dart';

import '../../controller/data/local/datahelper.dart';
import '../../model/task_model.dart';
import '../widget/default_form_field.dart';
import '../widget/main_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var formKey =GlobalKey<FormState>();
  var scafflodkey =GlobalKey<ScaffoldState>();
  TextEditingController titleController =TextEditingController();
  var timeController =TextEditingController();
  var dateController =TextEditingController();
  DataHelper dataHelper =DataHelper();
  var isbuttom= false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scafflodkey,
      // body: Column(
      //   children: [
      //     FloatingActionButton(onPressed: (){
      //       showBottomSheet(context: context,
      //         builder: (_)=>  SizedBox(
      //         height: 250,
      //         child: Form(
      //           key: formKey,
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               DefaultFormField(
      //                 validator: (value) {
      //                   if (value!.isEmpty) {
      //                     return "enter title";
      //                   }
      //                 },
      //                 controller: titleController,
      //                 keyboardType: TextInputType.text,
      //                 labelText: "title",
      //                 hintText: "enter your task",
      //               ),
      //               const SizedBox(height: 10,),
      //               DefaultFormField(
      //                   validator: (value) {
      //                     if (value!.isEmpty) {
      //                       return "enter time";
      //                     }
      //                   },
      //                   controller: timeController,
      //                   keyboardType: TextInputType.text,
      //                   labelText: "time",
      //                   hintText: "enter your time",
      //                   onTap: () {
      //                     showTimePicker(
      //                         context: context,
      //                         initialTime: TimeOfDay.now()).then((value) {
      //                       timeController.text = value!.format(context)
      //                           .toString();
      //                       print(value.format(context));
      //                     });
      //                   }
      //               ),
      //               const SizedBox(height: 10,),
      //               DefaultFormField(
      //                 validator: (value) {
      //                   if (value!.isEmpty) {
      //                     return "enter date";
      //                   }
      //                 },
      //                 controller: dateController,
      //                 keyboardType: TextInputType.text,
      //                 labelText: "date",
      //                 hintText: "enter your date",
      //                 onTap: () {
      //                   showDatePicker(
      //                     context: context,
      //                     initialDate: DateTime.now(),
      //                     firstDate: DateTime.now(),
      //                     lastDate: DateTime.parse('2025-12-19'),)
      //                       .then((value) {
      //                     dateController.text = DateFormat.
      //                     yMMMd().format(value!);
      //                   });
      //                 },
      //               ),
      //               const SizedBox(height: 10,),
      //               // MainButton(
      //               //   height: 30,
      //               //   text: 'Add',
      //               //   onTap: () {
      //               //     if(formKey.currentState!.validate()){
      //               //
      //               //       dataHelper.insertDb(
      //               //           TaskModel(
      //               //             title:  titleController.text,
      //               //             time:   timeController.text,
      //               //             date:  dateController.text,
      //               //           )
      //               //       );
      //               //       Navigator.push(context, MaterialPageRoute(
      //               //           builder: (_)=>TaskItem(
      //               //             time:timeController.text ,
      //               //             date: dateController.text,
      //               //             task: titleController.text,)
      //               //
      //               //       ));
      //               //     }
      //               //   },
      //               // ),
      //             ],
      //           ),
      //         ),
      //       ),);
      //     })
      //   ],
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()
       {
      if(isbuttom){
        if(formKey.currentState!.validate()){
          dataHelper.insertDb(
              TaskModel(
                title:  titleController.text,
                time:   timeController.text,
                date:  dateController.text,
              )
          );
          Navigator.pop(context);
          // Navigator.push(context, MaterialPageRoute(
          //     builder: (_)=>TaskItem(
          //       time:timeController.text ,
          //       date: dateController.text,
          //       task: titleController.text,)
          //
          // ));

        }
      }
      else
      {
      scafflodkey.currentState!.showBottomSheet((context) =>
          SizedBox(
            height: 250,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter title";
                      }
                    },
                    controller: titleController,
                    keyboardType: TextInputType.text,
                    labelText: "title",
                    hintText: "enter your task",
                  ),
                  const SizedBox(height: 10,),
                  DefaultFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "enter time";
                        }
                      },
                      controller: timeController,
                      keyboardType: TextInputType.text,
                      labelText: "time",
                      hintText: "enter your time",
                      onTap: () {
                        showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now()).then((value) {
                          timeController.text = value!.format(context)
                              .toString();
                          print(value.format(context));
                        });
                      }
                  ),
                  const SizedBox(height: 10,),
                  DefaultFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "enter date";
                      }
                    },
                    controller: dateController,
                    keyboardType: TextInputType.text,
                    labelText: "date",
                    hintText: "enter your date",
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.parse('2025-12-19'),)
                          .then((value) {
                        dateController.text = DateFormat.
                        yMMMd().format(value!);
                      });
                    },
                  ),
                  const SizedBox(height: 10,),
                  // MainButton(
                  //   height: 30,
                  //   text: 'Add',
                  //   onTap: () {
                  //     if(formKey.currentState!.validate()){
                  //
                  //       dataHelper.insertDb(
                  //           TaskModel(
                  //             title:  titleController.text,
                  //             time:   timeController.text,
                  //             date:  dateController.text,
                  //           )
                  //       );
                  //       Navigator.push(context, MaterialPageRoute(
                  //           builder: (_)=>TaskItem(
                  //             time:timeController.text ,
                  //             date: dateController.text,
                  //             task: titleController.text,)
                  //
                  //       ));
                  //     }
                  //   },
                  // ),
                ],
              ),
            ),
          ),);};
      isbuttom =!isbuttom;
      print("off");
    },
            child:Icon(Icons.add),

      ));

  }
}
