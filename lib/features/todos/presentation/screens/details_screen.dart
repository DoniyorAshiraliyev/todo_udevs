import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/data/data_source/local_data_source.dart';
import 'package:todo_udevs/features/todos/domain/entity/todo/todo.dart';
import 'package:todo_udevs/features/todos/presentation/constants/custom_button.dart';
import 'package:todo_udevs/features/todos/presentation/constants/styles.dart';
import 'package:todo_udevs/features/todos/presentation/screens/add/add_screen.dart';

class DetailsScreen extends StatefulWidget {
  final Todo todo;

  const DetailsScreen({super.key, required this.todo});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  void deleteData(int id) async {
    SqlDatabase.delete(id);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              width: size.width,
              height: size.height * .33,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddScreen(todo: widget.todo,)),),
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: const Icon(Icons.arrow_back_ios_new),
                        ),
                        const Spacer(),
                        Image.asset(
                          "assets/icons/edit.png",
                          height: 15,
                          width: 15,
                        ),
                        Text(
                          " Edit",
                          style:
                              Styles.ts14semibold.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.todo.name,
                    style: Styles.ts26semibold.copyWith(color: Colors.white),
                  ),
                  Text(
                    "Manchester United vs Arsenal (Premiere League)",
                    style: Styles.ts8regular.copyWith(color: Colors.white),
                  ),
                  Text(
                    widget.todo.time,
                    style: Styles.ts10medium.copyWith(color: Colors.white),
                  ),
                  Text(
                    widget.todo.location,
                    style: Styles.ts10medium.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Reminder",style: Styles.ts26semibold,),
                  const SizedBox(height: 10),

                  const Text("15 minutes befor",),
                  const SizedBox(height: 20),

                  const Text("Description",style: Styles.ts26semibold,),
                  const SizedBox(height: 15),

                  Text(
                   widget.todo.description ,style: Styles.ts10medium.copyWith(color: Styles.c999999),
                  ),
                  SizedBox(height: size.height*.33,),
                  CustomButton(
                    onTap: ()=>deleteData(widget.todo.id),
                    color: Styles.cfee8e9,
                    width: double.infinity,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/delete.png",
                          height: 20,
                          width: 20,
                        ),
                        const Text(" Delete Event")
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
