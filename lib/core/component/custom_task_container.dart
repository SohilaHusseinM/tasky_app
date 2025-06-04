import 'package:flutter/material.dart';
import '../model/task_model.dart';

class CustomTaskContainer extends StatefulWidget {
   CustomTaskContainer({super.key,required this.taskModel});

  final List<TaskModel> taskModel;

  @override
  State<CustomTaskContainer> createState() => _CustomTaskContainerState();
}

class _CustomTaskContainerState extends State<CustomTaskContainer> {
  bool isChecked=false;

  double _calcHeight(){
    return widget.taskModel.length*(8+73);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _calcHeight(),
      child: ListView.builder(
        /// If we remove the SizedBox, it will give an error because the ListView won't know the size you want from the screen.
        itemCount: widget.taskModel.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Container(
              // padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 23),
              height: widget.taskModel[index].description == '' ?  56 : 72,
              decoration: BoxDecoration(
                color: Color(0xFF282828),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.start,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.taskModel[index].title,
                          style: Theme.of(context).textTheme.displaySmall
                      ),
                      if (widget.taskModel[index].description != '')
                        Text(
                          widget.taskModel[index].description!,
                          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 14),
                        ),
                    ],
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
