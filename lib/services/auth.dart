import 'package:firebase_auth/firebase_auth.dart';
import 'package:gatchy_work/models/user.dart';
import 'package:gatchy_work/services/database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();


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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password); //firebase method
      FirebaseUser user = result.user;
      return _userFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithGoogle() async{
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    return _userFirebase(user);
  }



  // register with email and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      // Create a new document for user #uid
      await DatabaseService(uid: user.uid).updateUserData("testUser", "productivity", 100);

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



