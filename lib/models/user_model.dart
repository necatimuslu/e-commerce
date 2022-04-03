class UserModel {
  late String? id;
  late String? fullname;
  late String? username;
  late String? email;
  late String? image;
  late String? banner;
  late String? role;
  late bool? blocked;

  /*  late String? password; */
  /* late String? image;
  late String? banner; */
  UserModel(
      {this.id,
      this.fullname,
      this.username,
      this.email,
      this.role,
      this.blocked,
      this.image,
      this.banner});
  /*   this.password, */
  /*    this.image,
      this.banner, */
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    image = json['image']['url'];
    banner = json['banner']['url'];
    role = json['role'];
    blocked = json['blocked'];
  }

  /*  password = json['password']; */
  /*   image = json['image'];
    banner = json['banner']; */
}
