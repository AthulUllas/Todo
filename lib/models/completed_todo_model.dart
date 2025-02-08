class CompletedTodoModel {
  String title;
  String description;

  CompletedTodoModel({required this.title, required this.description});

  // Convert JSON to Model
  factory CompletedTodoModel.fromJson(Map<String, dynamic> json) {
    return CompletedTodoModel(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  // CopyWith method to create a new instance with updated values
  CompletedTodoModel copyWith({String? title, String? description}) {
    return CompletedTodoModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
