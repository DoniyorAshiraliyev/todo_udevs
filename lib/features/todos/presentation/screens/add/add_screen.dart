import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_udevs/features/todos/data/data_source/local_data_source.dart';
import 'package:todo_udevs/features/todos/domain/entity/todo/todo.dart';
import 'package:todo_udevs/features/todos/presentation/constants/custom_button.dart';
import 'package:todo_udevs/features/todos/presentation/constants/custom_textfield.dart';
import 'package:todo_udevs/features/todos/presentation/constants/styles.dart';
import 'package:todo_udevs/features/todos/presentation/screens/home/home_screen.dart';

class AddScreen extends StatefulWidget {
  final Todo? todo;

  const AddScreen({super.key, this.todo});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  //
  void pressSave() async {
    final date = DateTime.now();
    final year = "${date.year}";
    final month = "${date.month}".padLeft(2, "0");
    final day = "${date.day}".padLeft(2, "0");
    final hour = "${date.hour}".padLeft(2, "0");
    final minute = "${date.minute}".padLeft(2, "0");
    final second = "${date.second}".padLeft(2, "0");
    String dateStr = year + month + day + hour + minute + second;

    int id = int.parse(dateStr);
    if (widget.todo?.id != null) {
      id = widget.todo!.id;
    }

    SqlDatabase.insert(Todo(
            id: id,
            name: nameController.text,
            description: descriptionController.text,
            location: locationController.text,
            time: timeController.text,
            colorCode: 1))
        .then((_) {
      if (widget.todo?.id != null) {
        id = widget.todo!.id;
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => const HomeScreen()));
      }

      Navigator.pop(context, "Done");
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final List<int> list = [for (int i = 0; i <= 17; i++) i];
    int myValue = list.first;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Event name",
              style: Styles.ts14regular,
            ),
            CustomTextField(
              controller: nameController,
            ),
            const SizedBox(height: 10),
            const Text(
              "Event description",
              style: Styles.ts14regular,
            ),
            CustomTextField(
              lineCount: 3,
              controller: descriptionController,
            ),
            const SizedBox(height: 10),
            const Text(
              "Event location",
              style: Styles.ts14regular,
            ),
            CustomTextField(
              isSuffix: true,
              controller: locationController,
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                // color: Colors.white,

                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<int>(
                underline: const SizedBox(),
                value: myValue,
                icon: const Icon(CupertinoIcons.chevron_down),
                elevation: 16,
                borderRadius: BorderRadius.circular(8),
                onChanged: (int? value) {
                  // This is called when the user selects an item.
                  setState(() {
                    myValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Container(
                      height: 15,
                      width: 15,
                      color: Colors.primaries[value % 17].withOpacity(0.3),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Text(
              "Event time",
              style: Styles.ts14regular,
            ),
            CustomTextField(
              controller: timeController,
            ),
            const Spacer(),
            CustomButton(
              onTap: pressSave,
              width: double.infinity,
              widget: Text(
                "Add",
                style: Styles.ts16regular.copyWith(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
