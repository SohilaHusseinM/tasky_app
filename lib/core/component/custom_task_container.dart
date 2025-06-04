import 'package:flutter/material.dart';
import 'package:tasky/core/model/task_model.dart';

class CustomTaskContainer extends StatefulWidget {
  CustomTaskContainer({super.key, required this.taskModel}) {
    height= taskModel.description == null ?  90 : 80;
  }
  late final int height;
  final TaskModel taskModel;

  @override
  State<CustomTaskContainer> createState() => _CustomTaskContainerState();
}

class _CustomTaskContainerState extends State<CustomTaskContainer> {
  bool isChecked=false;

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 23),
        height: widget.height.toDouble(),
        decoration: BoxDecoration(
          color: Color(0xFF282828),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            Checkbox(
              checkColor: Colors.green,
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Column(
              children: [
                Text(widget.taskModel.title, style: Theme.of(context).textTheme.displaySmall),
                if (widget.taskModel.description != '')
                  Text(
                    widget.taskModel.description!,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
              ],
            ),
          ],
        ),
      );
  }
}
