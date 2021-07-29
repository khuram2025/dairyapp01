import 'package:cloud_firestore/cloud_firestore.dart';

class MUser {

  final String? id;
  final String? uid;
  final String? dsiplayName;
  final String? profession;
  final String? avatarURL;



  MUser({this.id, this.uid, this.profession, this.avatarURL, this.dsiplayName});

  factory MUser.fromDocument(QueryDocumentSnapshot data) {
    return MUser(
      id: data.id,
      uid: data.get('uid'),
      dsiplayName: data.get('display'),
      profession: data.get('profession'),
      avatarURL: data.get('avatar_url'),
    );
  }
  Map<String, dynamic> toMap(){
    return{
      'uid':uid,
      'display': dsiplayName,
      'profession': profession,
      'avatar_url': avatarURL,
    };
  }
}