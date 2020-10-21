import 'package:cc_app/screens/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:cc_app/constants.dart';
import 'package:cc_app/screens/home/components/home_screen.dart';
import 'package:cc_app/screens/wrapper.dart';
import 'package:cc_app/models/user.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CC App',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: HomeScreen(),
        home: Wrapper(),
      ),
    );
  }
}
