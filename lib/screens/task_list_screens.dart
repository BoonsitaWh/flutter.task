import 'package:flutter/material.dart';
import '../models/task.dart';
import 'Task_Form_Screens.dart';

class TaskListScreen extends StatefulWidget {
  TaskListScreen({super.key});
 
 
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}
 
class _TaskListScreenState extends State<TaskListScreen> {
 
  final List<Task> tasks = [
    Task(
      title: 'ทำการบ้าน',
      description: 'ส่งวันอังคารหน้า',
    ),
    Task(
      title: 'ซักผ้า',
      description: 'ซักเสื้อผ้าให้เรียบร้อย',
      isDone: true,
    ),
    Task(
      title: 'ซื้อของ',
      description: 'ซื้อของที่ตลาด',
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('งานที่ต้องทำ'),
      ), // AppBar
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length, // จำนวนงานทั้งหมด
        itemBuilder: (context, index) { // สร้าง widget สำหรับแต่ละแถว
          final task = tasks[index]; // ดึง task ตามตำแหน่ง
 
          return Card(
            child: ListTile(
              onTap: (){
                setState(() {
                  task.isDone = !task.isDone; //สลับสถาณะของงาน
                });
              },
              leading: Icon(
                task.isDone
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ), // Icon
              title: Text(task.title),
              subtitle: Text(task.description),

              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    tasks.remove(task);
                  });
                },
                
              ),
            ), // ListTile
          ); // Card
        },
      ), // ListView.builder

      
      floatingActionButton: FloatingActionButton(
        onPressed: () async { // ใช้ async เพื่อบอกว่าจะใช้ asynchronous
          final newTask = await Navigator.push<Task>(
             // ใช้ await เพื่อให้ ui รอผู้ใช้กรอก form ให้เสร็จเรียบร้อยแล้ว
            context,
            MaterialPageRoute(
              builder: (context) => TaskFormScreens(),
            ),
          );
          // หลังจากผู้ใช้กรอกฟอร์มและกด pop จากหน้า form กลับมาแล้ว
          // ก็จะทำการตรวจสอบว่าได้กรอกค่ามาหรือไม่ หากกรอกจะไม่เป็น null
          // ก็จะทำการสร้าง ui ใหม่ที่มี task ใหม่เพิ่มเข้ามา
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add),
      ), // FloatingActionButton
    ); // Scaffold
  }
}
 
 
 
 