import 'package:ecommerce_app_f2/pages/register_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _email, _password;
  bool _obscurePasswordTxt = true;

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
          RaisedButton(
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
            color: Theme.of(context).primaryColor,
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
