import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskapp39/model/task_model.dart';
import 'package:taskapp39/view/page/taskitem.dart';
import '../../controller/data/local/datahelper.dart';
import '../widget/default_form_field.dart';
import '../widget/main_button.dart';

class HomeScreen extends StatefulWidget {
 const  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

   TextEditingController titleController =TextEditingController();
   var timeController =TextEditingController();
   var dateController =TextEditingController();
   var currntindex=0;
   DataHelper dataHelper =DataHelper();
   var formKey =GlobalKey<FormState>();
   initState(){
     super.initState();
     dataHelper.createDb();
   }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "enter title";
                  }
                },
                controller:titleController ,
                keyboardType: TextInputType.text,
                labelText: "title",
                hintText: "enter your task",
              ),
              const SizedBox(height: 10,),
              DefaultFormField(
                  validator: (value){
                    if(value!.isEmpty){
                      return "enter time";
                    }
                  },
                controller:timeController ,
                keyboardType: TextInputType.text,
                labelText: "time",
                hintText: "enter your time",
                onTap: (){
                  showTimePicker(
                      context: context,
                      initialTime:TimeOfDay.now()).then((value) {
                      timeController.text= value!.format(context).toString();
                      print(value.format(context));
                  });
                }
              ),
              const SizedBox(height: 10,),
              DefaultFormField(
                validator: (value){
                  if(value!.isEmpty){
                    return "enter date";
                  }
                },
                controller:dateController ,
                keyboardType: TextInputType.text,
                labelText: "date",
                hintText: "enter your date",
                onTap: (){
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.parse('2025-12-19'),)
                      .then((value){
                    dateController.text = DateFormat.
                    yMMMd().format(value!);
                  });
                },
              ),
              const SizedBox(height: 10,),
              MainButton(
                height: 30,
                text: 'Add',
                onTap: () {
                  if(formKey.currentState!.validate()){

                  dataHelper.insertDb(
                    TaskModel(
                      title:  titleController.text,
                      time:   timeController.text,
                      date:  dateController.text,
                    )
                  );
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_)=>TaskItem(
                        time:timeController.text ,
                        date: dateController.text,
                        task: titleController.text,)

                  ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            index =currntindex;
            // changindex(index);
          });
          print (index);
        },
        currentIndex:currntindex ,
        items:const [
          BottomNavigationBarItem(icon:Icon(Icons.home),
            label: "HOME"
          ),
          BottomNavigationBarItem(icon:Icon(Icons.verified_user),
              label: "Profile"
          ),

        ],)
    );
  }
   // void changindex(int index){
   //   currntindex = index;
   // }
}

