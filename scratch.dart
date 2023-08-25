import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async{
  task1();
  String task2Result= await task2();
  task3(task2Result);
}
void task1() {
  print('task 1 done');
}

Future<String> task2() async{
  Duration threeSec = Duration(seconds: 3);
  String result='';
  await Future.delayed(threeSec, () {
    result='task 2 data';
    print('task 2 done');
  });
  return result;
}

void task3(String task2) {
  print('task 3 done $task2');
}
