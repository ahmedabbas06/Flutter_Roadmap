class PostModel {
  String id;
  int weekNumber;
  String titleEn;
  String titleAr;
  String type;
  String status;
  String postUrl;

  PostModel({
    required this.id,
    required this.weekNumber,
    required this.titleEn,
    required this.titleAr,
    required this.type,
    this.status = 'Not Started',
    this.postUrl = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weekNumber': weekNumber,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'type': type,
      'status': status,
      'postUrl': postUrl,
    };
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      weekNumber: json['weekNumber'] ?? 1,
      titleEn: json['titleEn'] ?? '',
      titleAr: json['titleAr'] ?? '',
      type: json['type'] ?? '',
      status: json['status'] ?? 'Not Started',
      postUrl: json['postUrl'] ?? '',
    );
  }

  PostModel copyWith({
    String? id,
    int? weekNumber,
    String? titleEn,
    String? titleAr,
    String? type,
    String? status,
    String? postUrl,
  }) {
    return PostModel(
      id: id ?? this.id,
      weekNumber: weekNumber ?? this.weekNumber,
      titleEn: titleEn ?? this.titleEn,
      titleAr: titleAr ?? this.titleAr,
      type: type ?? this.type,
      status: status ?? this.status,
      postUrl: postUrl ?? this.postUrl,
    );
  }
}
