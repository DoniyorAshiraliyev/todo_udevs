class Todo{
  int id;
  String name;
  String description;
  String location;
  String time;
  int colorCode;

  Todo({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.time,
    required this.colorCode,
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'location': location,
      'time': time,
      'colorCode': colorCode,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      location: json['location'] as String,
      time: json['time'] as String,
      colorCode: json['colorCode'] as int,
    );
  }


  @override
  String toString() {
    return 'Todo{id: $id, name: $name, description: $description, location: $location, time: $time, colorCode: $colorCode}';
  }

}

