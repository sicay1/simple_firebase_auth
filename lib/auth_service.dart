import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';

class AuthService with ChangeNotifier {
  var currUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // var currUser = {'email': 'aaaa'};
  
  AuthService() {
    print('new AuthService');
  }

  Future<User> getUser() async {
    // return Future.value(currUser);
    return _auth.currentUser;
  }

  Future logout() async {
    // this.currUser = null;
    // notifyListeners();
    // return Future.value(currUser);
    var res = FirebaseAuth.instance.signOut();
    notifyListeners();
    return res;
  }

  Future createUser(
      {String fname, String lname, String email, String pass}) async {}

  // Future loginUser({String email, String pass}) {
  //   if (pass == 'pass123') {
  //     this.currUser = {'email': email};
  //     notifyListeners();
  //     return Future.value(currUser);
  //   } else {
  //     this.currUser = null;
  //     return Future.value(null);
  //   }
  // }

  ///
  /// wrapping the firebase call to signInWithEmailAndPassword
  /// `email` String
  /// `password` String
  ///
  Future<UserCredential> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // since something changed, let's notify the listeners...
      notifyListeners();
      return result;
    }  catch (e) {
      // throw the Firebase AuthException that we caught
      throw new FirebaseAuthException(message: e);
    }
  }
}
