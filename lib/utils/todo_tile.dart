import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskComp;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskComp,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Color.fromARGB(255, 255, 43, 43),
                borderRadius: const BorderRadius.all(Radius.circular(16)))
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.deepPurple[200],
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(-8, -8),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 98, 68, 149),
                  offset: Offset(4, 4),
                  blurRadius: 40,
                  spreadRadius: 1,
                )
              ]),
          child: Row(
            children: [
              Checkbox(
                value: taskComp,
                onChanged: (value) {
                  if (onChanged != null) {
                    onChanged!(value);
                  }
                },
                activeColor: Colors.transparent,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskComp
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
