class CategoryModel {
  String? slug;
  late final String name;
  String? url;

  CategoryModel({this.slug, required this.name, this.url});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    url = json['url'];
  }

}
