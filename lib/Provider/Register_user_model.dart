class RegisterUserModel {
  String? uid;
  String? name;
  String? email;
  String? password;

  RegisterUserModel({
    this.uid,
    this.name,
    this.email,
    this.password,
  });

  factory RegisterUserModel.fromMap(map) {
    return RegisterUserModel(
        uid: map['uid'],
        name: map['name'],
        email: map['email'],
        password: map['password']);
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'name': name, 'email': email, 'password': password};
  }
}
