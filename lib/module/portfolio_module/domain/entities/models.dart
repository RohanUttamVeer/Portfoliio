class ProjectModel {
  String? title;
  String? description;
  String? image1;
  String? image2;
  ProjectModel({
    required this.title,
    required this.description,
    required this.image1,
    required this.image2,
  });
}

class ExperienceModel {
  String? role;
  String? companyName;
  String? companyLogo;
  String? experience;
  bool? isFeedback;
  String? feedbackImage;
  String? feedbackBy;
  String? feedback;
  ExperienceModel({
    required this.role,
    required this.companyName,
    required this.companyLogo,
    required this.experience,
    required this.isFeedback,
    required this.feedbackImage,
    required this.feedbackBy,
    required this.feedback,
  });
}

class GithubRepoModel {
  String? id;
  String? name;
  String? link;
  String? language;
  GithubRepoModel({
    required this.id,
    required this.name,
    required this.link,
    required this.language,
  });
}
