import 'package:diary_app01/widgets/input_decorations.dart';
import 'package:diary_app01/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final GlobalKey<FormState>? _globalKey = GlobalKey<FormState>();



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

                child: LoginForm(
                  formKey: _globalKey,
                    emailTextController: _emailTextController,
                    passwordTextController: _passwordTextController),)
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


