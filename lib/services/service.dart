
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app01/model/users.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';


class DiaryService {
  final CollectionReference userCollectionReference =
  FirebaseFirestore.instance.collection('users');

  Future<void> loginUser(String email, String password) async {
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return;
  }

  Future <void> createUser(String displayName, BuildContext context, String uid) async {
  MUser user = MUser(

    dsiplayName:  displayName,
    avatarURL : "https://picsum.photos/200/300",
    profession : 'Hello World',
    uid: uid,


  );
  userCollectionReference.add(user.toMap());
  return;
  }

}