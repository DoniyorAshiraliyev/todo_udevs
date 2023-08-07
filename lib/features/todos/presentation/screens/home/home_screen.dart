import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_udevs/features/todos/data/data_source/local_data_source.dart';
import 'package:todo_udevs/features/todos/domain/entity/todo/todo.dart';
import 'package:todo_udevs/features/todos/presentation/bloc/todo_bloc.dart';
import 'package:todo_udevs/features/todos/presentation/constants/card_item.dart';
import 'package:todo_udevs/features/todos/presentation/screens/details_screen.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/views/calendar/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> items = [];

  void getAllData() async {
    items = await SqlDatabase.readAll();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getAllData();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<TodoBloc, TodoState>(
        bloc: TodoBloc(),
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Image.asset(
                      "assets/icons/notification.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  SizedBox(
                    width: size.width - 50,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalendarItem(),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final color = Colors.primaries[index % 17];
                        return CardItem(
                          color: color,
                          textColor: color.shade900,
                          eventName: items[index].name,
                          eventDescription: items[index].description,
                          eventLocation: items[index].location,
                          eventTime: items[index].time,
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailsScreen(
                                todo: items[index],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
