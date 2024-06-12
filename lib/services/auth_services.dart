import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  // Google Auth Sign in
  signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //obtain details from auth request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // finally sign-in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}



// keytool -list -v -alias androiddebugkey -keystore C:\Users\ceemi\.android\debug.keystore -storepass android -keypass android