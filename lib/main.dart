import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_udevs/app.dart';
import 'package:todo_udevs/features/todos/data/data_source/local_data_source.dart';

late final Future<Database> database;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SqlDatabase.init();
  runApp(const ToDoApp());
}

