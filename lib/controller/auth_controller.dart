import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_app/const/firebase_const.dart';
import 'package:velocity_x/velocity_x.dart';
class AuthController extends GetxController{
  // text Controller
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //login method
  Future<UserCredential?> loginMethod({context, email, password}) async{
    UserCredential? userCredential;
    try{
      userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //sign up method
  Future<UserCredential?> signupMethod({email, password, context}) async{
    UserCredential? userCredential;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data method
  storeUserData({name, password, email}) async{
    DocumentReference store = await firestore.collection(userCollection).doc(currentUser!.uid);
    store.set({
      'name':name,
      'password': password,
      'email': email,
      'imageUrl': '',
      'id': currentUser!.uid,
    });
  }

  //sign out method
  signoutMethod(context) async{
     try{
      await auth.signOut();

    }on FirebaseAuthException catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }
}