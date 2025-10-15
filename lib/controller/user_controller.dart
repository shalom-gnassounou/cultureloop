import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
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
  Future<User?>loginwithFacebook() async {
    FirebaseAuth auth =FirebaseAuth.instance;
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      final accessToken = result.accessToken!.token;
      final facebookAuthCredential = FacebookAuthProvider.credential(accessToken);
      await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    }
    return auth.currentUser;
  }
  Future<void> logout() async {
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();

  }



}

extension on AccessToken {
   get token => null;
}