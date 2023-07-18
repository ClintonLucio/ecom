import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServices{
  //..first firebase calls
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //let's create registration function
  
  Future<User?> register(String email, String password, BuildContext context) async{
    try{
      //call with Usercredential
      UserCredential usercredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, 
      password: password);
      return usercredential.user;
    }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),
      backgroundColor: Colors.red,));
    }catch(e){
       print(e);
    }
     return null;
  }
  //now let's go ahead and create with userlogins
  //now first and foremost create a login function to operate with
 Future<User?> login(String email, String password, BuildContext context) async{
  try{
  UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email,
  password: password);
  return userCredential.user;
  }on FirebaseAuthException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message.toString()),
      backgroundColor: Colors.red,
      ));
  }catch(e){
    print(e);
  }
  return null;
 }
 //signing in with gmail
Future<User?> signInWithGoogle() async{
   try{
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  if(googleUser != null){
   //obtain the auth details from the request
   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
   //create new credential
   final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken
   );
   //once signed in
   UserCredential userCredential = await firebaseAuth.signInWithCredential(credential);  
   return userCredential.user;

  }
   }
   catch(e){
      print(e);
   }
   return null;
}

}