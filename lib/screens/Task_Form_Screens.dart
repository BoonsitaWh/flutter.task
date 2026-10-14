import 'package:flutter/material.dart';
import '../models/task.dart';
class TaskFormScreens extends StatelessWidget{
   TaskFormScreens({super.key});
 
final titleController = TextEditingController();
final descriptionController = TextEditingController();
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มงานใหม่'),
      ), // AppBar
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'ชื่องาน',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
           
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                labelText: 'รายละเอียด',
                border: OutlineInputBorder(),
              ),
            ),
 
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                final newTask = Task(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                Navigator.pop(
                  context,
                  newTask,
                );
              },
              
              child: const Text('บันทึก')
              ),
          ],
        ),
      ),
    ); // Scaffold
  }
}
 
 