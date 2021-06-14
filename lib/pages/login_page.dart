import 'dart:convert';

import 'package:ecommerce_app_f2/pages/products_page.dart';
import 'package:http/http.dart' as http;

import 'package:ecommerce_app_f2/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _email, _password;
  bool _obscurePasswordTxt = true;
  bool isSubmitting = false;

  Widget _showTitle() => Text(
        'Login',
        style:
            Theme.of(context).textTheme.headline5.copyWith(color: Colors.amber),
      );

  Widget _showEmailInput() => TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
          hintText: 'Enter email',
          icon: Icon(
            Icons.email,
            color: Colors.grey,
          ),
        ),
        validator: (val) => !val.contains('@') ? 'Invalid email' : null,
        onSaved: (val) => _email = val,
      );

  Widget _showPasswordInput() => TextFormField(
        obscureText: _obscurePasswordTxt,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Password',
          hintText: 'Enter password, min length 6',
          icon: Icon(
            Icons.security,
            color: Colors.grey,
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() => _obscurePasswordTxt = !_obscurePasswordTxt);
            },
            child: Icon(
              _obscurePasswordTxt ? Icons.visibility : Icons.visibility_off,
            ),
          ),
        ),
        validator: (val) => val.length < 6 ? 'Password too short' : null,
        onSaved: (val) => _password = val,
      );

  Widget _showFormActions() => Column(
        children: [
          isSubmitting
              ? CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation(Theme.of(context).accentColor),
                )
              : RaisedButton(
                  onPressed: _submit,
                  child: Text(
                    'Submit',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.black),
                  ),
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Theme.of(context).accentColor,
                ),
          FlatButton(
            onPressed: () =>
                Navigator.pushReplacementNamed(context, RegisterPage.routeName),
            child: RichText(
              text: TextSpan(
                text: 'New User ? ',
                children: [
                  TextSpan(
                    text: 'Register',
                    style: TextStyle(
                      color: Colors.orangeAccent,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      );

  void _submit() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      _registerUser();
    }
  }

  void _registerUser() async {
    setState(() {
      isSubmitting = true;
    });
    //LOGIN ENDPOINT
    final response = await http.post(
      'http://localhost:1337/auth/local',
      body: {
        "identifier": _email,
        "password": _password,
      },
    );
    final responseBody = json.decode(response.body);
    setState(() {
      isSubmitting = false;
    });
    if (response.statusCode == 200) {
      print('Login Response -> $responseBody');
      _showSnackBar(
        text: 'User successfully Logged IN !',
        textColor: Colors.green,
      );
      _formKey.currentState.reset(); //Reset Form
      //Success
      _redirectUser();
    } else {
      final errorMessage = responseBody['message'];
      _showSnackBar(text: errorMessage, textColor: Colors.red);
      throw Exception('Error Logging IN : $errorMessage');
    }
  }

  void _showSnackBar({String text, Color textColor}) {
    final snackBar = SnackBar(
      content: Text(
        text ?? ' ',
        style: TextStyle(color: textColor ?? Colors.white),
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void _redirectUser() {
    Future.delayed(
      Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, ProductsPage.routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //TITLE
                  _showTitle(),
                  SizedBox(height: 20),
                  //EMAIL
                  _showEmailInput(),
                  SizedBox(height: 20),
                  //Password
                  _showPasswordInput(),
                  SizedBox(height: 20),
                  //FORM ACTIOns
                  _showFormActions(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
