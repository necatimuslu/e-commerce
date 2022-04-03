class TweetUserIdModel {
  String? id;
  String? description;
  String? image;
  UserId? userId;
  TweetUserIdModel({this.id, this.description, this.image, this.userId});

  TweetUserIdModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    image = json['image']['url'];
    userId = UserId.fromJson(json['userId']);
  }
}

class UserId {
  UserId({
    this.image,
    this.banner,
    this.fullname,
    this.role,
    this.blocked,
    this.id,
    this.username,
    this.email,
  });

  String? image;
  String? banner;
  String? fullname;
  String? role;
  bool? blocked;
  String? id;
  String? username;
  String? email;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        image: json["image"]['url'],
        banner: json["banner"]['url'],
        fullname: json["fullname"],
        role: json["role"],
        blocked: json["blocked"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
      );
}
