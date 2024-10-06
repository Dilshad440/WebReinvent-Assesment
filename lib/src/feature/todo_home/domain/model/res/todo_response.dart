class TodoResponse {
  String? id;
  String? title;
  String? description;
  bool? isCompleted;
  String? createdAt;

  TodoResponse({
    this.id,
    this.title,
    this.description,
    this.isCompleted,
    this.createdAt,
  });

  TodoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    isCompleted = json['isCompleted'] == 0 ? false : true;
    createdAt = json['created_at'];
  }
}
