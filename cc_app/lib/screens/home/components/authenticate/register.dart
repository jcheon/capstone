import 'package:cc_app/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cc_app/constants.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  // test field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0.0,
            title: Text('Sign up to CC app'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign in'),
                onPressed: () {
                  widget.toggleView();
                },
              )
            ]),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecor.copyWith(hintText: 'Email'),
                    // decoration: InputDecoration(
                    //   hintText: 'Email',
                    //   fillColor: Colors.white,
                    //   filled: true,
                    //   enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colors.white, width: 2.0)),
                    //   focusedBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colors.pink, width: 2.0)),
                    // ),
                    validator: (val) => val.isEmpty ? 'Enter an email' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: textInputDecor.copyWith(hintText: 'Password'),
                    // decoration: InputDecoration(
                    //   hintText: 'Password',
                    //   fillColor: Colors.white,
                    //   filled: true,
                    //   enabledBorder: OutlineInputBorder(
                    //       borderSide:
                    //           BorderSide(color: Colors.white, width: 2.0)),
                    // ),
                    validator: (val) => val.length < 6
                        ? 'Enter a password 6+ chars long'
                        : null,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.pink[400],
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          email, password);

                      if (result == null) {
                        setState(() => error = 'Please use a valid email');
                      }
                    }
                  },
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                ),
              ],
            ),
          ),
        ));
  }
}
