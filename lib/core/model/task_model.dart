class TaskModel {
  final int id;
  final String title;
  final String description;
  final bool isHighPriority;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isHighPriority,
  });

  factory TaskModel.fromMap(Map<String,dynamic>map){ //Factory DP
    return TaskModel(
        id: map['id'] ,
        title: map['title'] as String,
        description: map['description'] as String,
        isHighPriority: map['isHighPriority'] as bool,
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title':title,
      'description' : description,
      'isHighPriority':isHighPriority,
    };
  }

}
