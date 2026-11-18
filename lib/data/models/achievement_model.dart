class AchievementModel {
  String id;
  String titleEn;
  String titleAr;
  String descriptionEn;
  String descriptionAr;
  String iconName;
  int requiredXp;
  bool isUnlocked;

  AchievementModel({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.iconName,
    required this.requiredXp,
    this.isUnlocked = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titleEn': titleEn,
      'titleAr': titleAr,
      'descriptionEn': descriptionEn,
      'descriptionAr': descriptionAr,
      'iconName': iconName,
      'requiredXp': requiredXp,
      'isUnlocked': isUnlocked,
    };
  }

  factory AchievementModel.fromJson(Map<String, dynamic> json) {
    return AchievementModel(
      id: json['id'] ?? '',
      titleEn: json['titleEn'] ?? '',
      titleAr: json['titleAr'] ?? '',
      descriptionEn: json['descriptionEn'] ?? '',
      descriptionAr: json['descriptionAr'] ?? '',
      iconName: json['iconName'] ?? 'star',
      requiredXp: json['requiredXp'] ?? 0,
      isUnlocked: json['isUnlocked'] ?? false,
    );
  }
}
