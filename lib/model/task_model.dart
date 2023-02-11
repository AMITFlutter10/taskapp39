class TaskModel{
  String title;
  String time;
  String date;

  TaskModel({required this.title,required this.time,required this.date});

  // btrsl
  //datatype

  Map<String, dynamic> toMap() {
    return {
      //key : value
      'title': this.title,
      'time': this.time,
      'date': this.date,
    };
  }
 factory  TaskModel.fromMap(Map<String, dynamic> m) {
    return TaskModel(
      title: m['title'] ,
      time: m['time'] ,
      date: m['date'],
    );
  }
// TaskModel.name(this.title, this.time, this.date);

}