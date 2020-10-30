import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_firebase_auth/auth_service.dart';
// import 'package:simple_firebase_auth/login_page.dart';
// import 'package:simple_firebase_auth/main.dart';

class HomePage extends StatefulWidget {
  final User currentUser;

  const HomePage(this.currentUser);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Flutter Firebase"),
        //actions: <Widget>[LogoutButton()],
      ),
      body: Column(children: [
        SizedBox(height: 20.0),
        Text('Home Page Flutter Firebase Content',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 20.0),
        Text(
          'Welcome ${widget.currentUser.email}',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        SizedBox(height: 20.0),
        RaisedButton(
            child: Text('Logout'),
            onPressed: () async {
              await Provider.of<AuthService>(context, listen: false).logout();
              // Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));
            })
      ] //: Text('Home Page Flutter Firebase  Content'),
          ),
    );
  }
}
