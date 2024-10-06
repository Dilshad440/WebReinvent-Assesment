class AddTodoReq {
  String? id;
  String? title;
  String? description;
  bool isCompleted;
  String? createdAt;

  AddTodoReq({
    this.id,
    this.title,
    this.description,
    this.isCompleted = false,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['isCompleted'] = isCompleted == false ? 0 : 1;
    data['created_at'] = createdAt;
    return data;
  }
}
