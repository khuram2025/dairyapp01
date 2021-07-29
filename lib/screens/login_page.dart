import 'package:diary_app01/widgets/creat_account_form.dart';
import 'package:diary_app01/widgets/input_decorations.dart';
import 'package:diary_app01/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final GlobalKey<FormState>? _globalKey = GlobalKey<FormState>();

  bool isCreateAccountClicked = false;
  
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

                child: isCreateAccountClicked ? CreateAccountForm(
                  formKey: _globalKey,
                      emailTextController: _emailTextController,
                      passwordTextController: _passwordTextController):
                  LoginForm(
                      formKey: _globalKey,
                        emailTextController: _emailTextController,
                        passwordTextController: _passwordTextController),
                ),
                // LoginForm(
                //   formKey: _globalKey,
                //     emailTextController: _emailTextController,
                //     passwordTextController: _passwordTextController),
                TextButton.icon(onPressed: (){
                  setState(() {
                    if (!isCreateAccountClicked){
                      isCreateAccountClicked = true;
                    }
                    else{
                      isCreateAccountClicked =false;
                    }
                  });
                }, icon: Icon(Icons.portrait_rounded),
                    label: Text(isCreateAccountClicked ? "Already have an account?" : "CreateAccount",),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.italic
                  )
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


