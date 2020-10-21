import 'package:cc_app/screens/home/components/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:cc_app/screens/home/components/home_screen.dart';
import 'package:cc_app/screens/home/components/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'package:cc_app/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return HomeScreen();
    }
    // return either home or auth widget
    // return HomeScreen();
    // return Authenticate();
  }
}
