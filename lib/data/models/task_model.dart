class TaskModel {
  String id;
  String titleEn;
  String titleAr;
  bool isCompleted;

  TaskModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] ?? '',
      titleEn: json['titleEn'] ?? '',
      titleAr: json['titleAr'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }

  TaskModel copyWith({
    String? id,
    String? titleEn,
    String? titleAr,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id ?? this.id,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
