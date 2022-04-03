class TweetModel {
  String? id;
  String? description;
  String? image;
  String? userId;
  List<String>? likes;
  List<String>? retweet;
  TweetModel(
      {this.id,
      this.description,
      this.image,
      this.userId,
      this.likes,
      this.retweet});

  TweetModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    image = json['image']['url'];
    userId = json['userId']['_id'];
    likes = List<String>.from(json["likes"].map((x) => x));
    retweet = List<String>.from(json["retweet"].map((x) => x));
  }
}
