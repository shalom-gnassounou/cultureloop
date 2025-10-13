import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class UserController {
  Future<User?>loginwithGoogle() async {
    FirebaseAuth auth =FirebaseAuth.instance;
    final googleAcount = await GoogleSignIn().signIn();
    final googleAuth = await googleAcount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await auth.signInWithCredential(credential);
    final user = userCredential.user;
    return user;


  }
  Future<User?>loginwithApple() async {
    FirebaseAuth auth =FirebaseAuth.instance;
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oauthCredential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );
    await FirebaseAuth.instance.signInWithCredential(oauthCredential);
    return auth.currentUser;
  }

}