
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app01/model/users.dart';
import 'package:flutter/cupertino.dart';

class DiaryService {
  final CollectionReference userCollectionReference =
  FirebaseFirestore.instance.collection('users');

  Future <void> createUser(String displayName, BuildContext context, String uid) async {
  MUser user = MUser(

    dsiplayName:  displayName,
    avatarURL : "https://google.com",
    profession : 'Hello World',
    uid: uid,


  );
  userCollectionReference.add(user.toMap());
  return;
  }

}