class ServiceEntityModel {
  final String title;
  final String description;
  final String ottPlatform;
  final String posterImage;

  ServiceEntityModel({
    required this.posterImage,
    required this.title,
    required this.description,
    required this.ottPlatform,
  });

  factory ServiceEntityModel.fromJson(Map<String, dynamic> json) {
    return ServiceEntityModel(
      posterImage: json['img'],
      title: json['title'],
      description: json['desc'],
      ottPlatform: json['ott'],
    );
  }
}
