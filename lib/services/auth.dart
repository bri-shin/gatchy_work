import 'package:firebase_auth/firebase_auth.dart';
import 'package:gatchy_work/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on Firebase user
  User _userFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream (from our custom user)
  Stream<User> get user {
    return _auth.onAuthStateChanged
      //.map((FirebaseUser user) => _userFirebase(user));
      .map(_userFirebase);    //same thing as above
  }

  // sign in method: anonymous
  Future signInAnonymous() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  // sign in method: email and pass

  // register with email and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }


  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut(); //firebase default
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

} 