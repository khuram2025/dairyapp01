import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary_app01/model/users.dart';
import 'package:diary_app01/screens/main_page.dart';
import 'package:diary_app01/services/service.dart';
import 'package:diary_app01/widgets/input_decorations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CreateAccountForm extends StatelessWidget {
  const CreateAccountForm({
    Key? key,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController,

    GlobalKey<FormState>? formKey,

  }) : _emailTextController = emailTextController, _passwordTextController = passwordTextController,
        _globalKey = formKey,
        super(key: key);

  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;
  final GlobalKey<FormState>? _globalKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        mainAxisSize:MainAxisSize.min,
        children: [
          Text("Please Enter a valid Username & Password contain 6 digit "),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value){
                return value!.isEmpty ?  'Please add an email' : null;
              },
              controller: _emailTextController,
              decoration: buildInputDecoration("email", 'Johan@email.com'),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              validator: (value){
                return value!.isEmpty ?  'Please enter Password' : null;
              },

              obscureText: true,
              controller: _passwordTextController,
              decoration: buildInputDecoration("Password", 'Enter Password'),
            ),
          ),
          SizedBox(height: 20,),
          TextButton(
              style: TextButton.styleFrom(
                  primary: Colors.white,
                  padding: EdgeInsets.all(15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4
                    ),
                  ),
                  backgroundColor: Colors.green,
                  textStyle: TextStyle(
                    fontSize: 18,
                  )
              ),
              onPressed: (){
                if (_globalKey!.currentState!.validate()) {
                  String email = _emailTextController.text;
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email, password: _passwordTextController.text)
                      .then((value) {
                        if (value.user!= null) {
                          String uid = value.user!.uid;
                          DiaryService()
                              .createUser(email.split('@')[0], context, uid).then((value) {
                                DiaryService().loginUser(email, _passwordTextController.text).then((value) {
                                  return Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return MainPage();
                                  }));
                                });
                              });
                        }
                      });
                }
              }, child: Text('Create Account'))
        ],
      ),
    );
  }
}