//User Model/Class for storing info in firestore/firebase-auth
class UserModel {
  String? uid;
  String? email;
  String? firstName;
  String? secondName;

  UserModel({this.uid, this.email, this.firstName, this.secondName});
  factory UserModel.fromMap(map) {
    return new UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}
