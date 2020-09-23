class LoginInfo {
  String id;
  String name;
  String email;
  String imageUrl;
  String loginFrom;

  LoginInfo({
    this.id,
    this.name,
    this.email,
    this.imageUrl,
    this.loginFrom
  });

  factory LoginInfo.fromJson(Map<String, dynamic> data) {
    return LoginInfo(
      id: data['userData']['_id'],
      name: data['userData']['name'],
      email: data['userData']['email'],
      imageUrl: data['userData']['imgUri'],
      loginFrom: data['userData']['loginFrom']
    );
  }


}
