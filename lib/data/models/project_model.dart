class ProjectModel {
  String id;
  int weekNumber;
  String nameEn;
  String nameAr;
  String descriptionEn;
  String descriptionAr;
  String status;
  List<String> checklistEn;
  List<String> checklistAr;
  List<bool> checklistStatus;
  String repoUrl;
  String notes;
  String startDate;
  String completionDate;

  ProjectModel({
    required this.id,
    required this.weekNumber,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    this.status = 'Not Started',
    required this.checklistEn,
    required this.checklistAr,
    required this.checklistStatus,
    this.repoUrl = '',
    this.notes = '',
    this.startDate = '',
    this.completionDate = '',
  });

  double get progressPercentage {
    if (checklistStatus.isEmpty) return status == 'Completed' ? 1.0 : 0.0;
    int completedCount = checklistStatus.where((item) => item).length;
    return completedCount / checklistStatus.length;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'weekNumber': weekNumber,
      'nameEn': nameEn,
      'nameAr': nameAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'status': status,
      'checklistEn': checklistEn,
      'checklistAr': checklistAr,
      'checklistStatus': checklistStatus,
      'repoUrl': repoUrl,
      'notes': notes,
      'startDate': startDate,
      'completionDate': completionDate,
    };
  }

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] ?? '',
      weekNumber: json['weekNumber'] ?? 1,
      nameEn: json['nameEn'] ?? '',
      nameAr: json['nameAr'] ?? '',
      descriptionEn: json['descriptionEn'] ?? '',
      descriptionAr: json['descriptionAr'] ?? '',
      status: json['status'] ?? 'Not Started',
      checklistEn: List<String>.from(json['checklistEn'] ?? []),
      checklistAr: List<String>.from(json['checklistAr'] ?? []),
      checklistStatus: List<bool>.from(json['checklistStatus'] ?? []),
      repoUrl: json['repoUrl'] ?? '',
      notes: json['notes'] ?? '',
      startDate: json['startDate'] ?? '',
      completionDate: json['completionDate'] ?? '',
    );
  }

  ProjectModel copyWith({
    String? id,
    int? weekNumber,
    String? nameEn,
    String? nameAr,
    String? descriptionEn,
    String? descriptionAr,
    String? status,
    List<String>? checklistEn,
    List<String>? checklistAr,
    List<bool>? checklistStatus,
    String? repoUrl,
    String? notes,
    String? startDate,
    String? completionDate,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      weekNumber: weekNumber ?? this.weekNumber,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      descriptionEn: descriptionEn ?? this.descriptionEn,
      descriptionAr: descriptionAr ?? this.descriptionAr,
      status: status ?? this.status,
      checklistEn: checklistEn ?? this.checklistEn,
      checklistAr: checklistAr ?? this.checklistAr,
      checklistStatus: checklistStatus ?? this.checklistStatus,
      repoUrl: repoUrl ?? this.repoUrl,
      notes: notes ?? this.notes,
      startDate: startDate ?? this.startDate,
      completionDate: completionDate ?? this.completionDate,
    );
  }
}
