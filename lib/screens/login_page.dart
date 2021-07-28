import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailTextController;
  final TextEditingController _passwordTextController;

  final GlobalKey<FormState>? _globalKey;

  const LoginPage({Key? key,
    GlobalKey<FormState>? formkey,
    required TextEditingController emailTextController,
    required TextEditingController passwordTextController}) :
        _emailTextController = emailTextController,
        _passwordTextController = passwordTextController,
        _globalKey = formkey,
        super(key: key);


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: Color(0XffB9C2D1),
                )),
            Text("Sign in",
            style: Theme.of(context).textTheme.headline5,),
            SizedBox(height: 10,),
            Column(
              children: [
                SizedBox(width: 300,
                height: 300,
                child: Form(
                  child: Column(
                    mainAxisSize:MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailTextController,
                      )
                    ],
                  ),
                ),)
              ],
            ),
            Expanded(
                flex: 2,
                child: Container(
              color: Color(0XffB9C2D1),
            ))

          ],
        ),
      ),
    );
  }
}
