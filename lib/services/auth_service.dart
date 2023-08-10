import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  signInWithGoogle() async {
    //begin sign process\
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //obtain auth
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //create a new cred
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
