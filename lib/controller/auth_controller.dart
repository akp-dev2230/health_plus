import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_plus/consts/const.dart';

class AuthController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  String? selectedGender;
  String? userName = '';

  //login method
  Future<UserCredential?> loginMethod({context}) async{
    UserCredential? userCredential;

    try{
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passController.text
      );
      if(userCredential.user !=null && !userCredential.user!.emailVerified){
        Get.snackbar("","",
          titleText: const Text("Warning", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
          messageText: const Text("Please verify your email before you log in.", style: TextStyle(fontSize: 16, color: Colors.black),),
          backgroundColor: Colors.white,
        );
        return null;
      }
    } on FirebaseAuthException catch(e){
      Get.snackbar("","",
        titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
        messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.white,
      );
    }
    return userCredential;
  }


  //signup method
  Future<UserCredential?> signupMethod({name, email, phone, password}) async{
    UserCredential? userCredential;

    try {
      userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email, password: password);
      await storeUserData(name: name, email: email, phone: phone, password: password);

      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification().then((value){
          Get.snackbar("","",
            titleText: const Text("Verification email sent", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
            messageText: const Text("Please check your inbox.", style: TextStyle(fontSize: 16, color: Colors.black),),
            backgroundColor: Colors.white,
          );
        }); // Send verification email
      }
    } on FirebaseAuthException catch(e){
      Get.snackbar("","",
        titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
        messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.white,
      );
    }
    return userCredential;
  }


  //storing data
  Future<void> storeUserData({name, email, phone, password}) async{
    DocumentReference store = FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid);
    await store.set({
      'name': name,
      'email': email,
      'id': FirebaseAuth.instance.currentUser!.uid,
      'phone': phone,
      'password': password,
      'profileImageUrl': "",
    });
  }


  //logout method
  Future<void> logoutMethod() async{
    try{
      await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut().then((value){
        Get.snackbar("","",
          titleText: const Text("successfully logout", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
          backgroundColor: Colors.white,
        );
      });
    }catch(e){
      Get.snackbar("","",
        titleText: const Text("Log out failed", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
        messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.white,
      );
    }
  }


  //reset password method
  Future<void> sendPasswordResetLink({email}) async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }on FirebaseAuthException catch(e){
      Get.snackbar("","",
        titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
        messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.white,
      );
    }
  }


  //google sign in method
  Future<UserCredential?> signInWithGoogle() async {
    UserCredential? userCredential;
    try {
      // Trigger the Google Sign-In flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // User canceled sign-in

      // Obtain Google Sign-In authentication details
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the credential
      userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      // After successful sign-in, store user data in Firestore
      final user = userCredential.user;
      if (user != null) {
        final name = user.displayName ?? ""; // If null, store empty
        final email = user.email ?? "";       // If null, store empty
        final phone = user.phoneNumber ?? ""; // If null, store empty
        const password = "";                  // Not available from Google

        await storeUserData(
          name: name,
          email: email,
          phone: phone,
          password: password,
        );
      }

    } catch (e) {
      Get.snackbar(
        "Google Sign-In Failed",
        e.toString(),
        backgroundColor: Get.theme.snackBarTheme.backgroundColor,
      );
    }
    return userCredential;
  }



  //check email is registered or not
  Future<bool> checkUserExistence({email}) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      return false;
    }
  }


  //retreive current username from firestore
  Future<void> fetchUserName() async{
    User? user = FirebaseAuth.instance.currentUser;
    try{
      if(user != null){
        DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();

        userName = userDoc['name'] ?? 'User';
      }
    }on FirebaseAuthException catch (e){
      Get.snackbar("","",
        titleText: const Text("Error", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),),
        messageText: Text("$e", style: const TextStyle(fontSize: 16, color: Colors.black),),
        backgroundColor: Colors.white,
      );
    }
  }


}