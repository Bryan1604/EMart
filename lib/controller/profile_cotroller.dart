import 'dart:io';

// import 'package:chat_app/const/consts.dart';
import 'package:chat_app/const/firebase_const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:path/path.dart';
class ProfileController extends GetxController{

  var profileImgPath = ''.obs;
  var profileImageLink = '';
  var isLoading = false.obs;
  //textfield
  var nameController = TextEditingController();
  var oldpassController = TextEditingController();
  var newpassController = TextEditingController();

  changeImage(context) async{
    try{
      final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70 );
      if (img == null) return;
      //  {
      //   final img = await ImagePicker().pickImage(source: ImageSource.gallery,imageQuality: 70 );
      //   if(img == null) return;
      // }
      profileImgPath.value = img.path;
    }on PlatformException catch(e){
      VxToast.show(context, msg: e.toString());
    }
  }

  uploadProfileImage() async{
    var filename = basename(profileImgPath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImgPath.value));
    profileImageLink = await ref.getDownloadURL();
  }

  updateProfile({name, password, imgUrl}) async{
    var store = await firestore.collection(userCollection).where('email',isEqualTo: currentUser!.email).get();
    final documents = store.docs;
    if(documents.isNotEmpty){
      final userDocument = documents.first;
      await userDocument.reference.update(
        {
          'name': name,
          'password': password,
          'imageUrl': imgUrl,
        }); //SetOptions(merge: true));
      isLoading(false);
    }
  }

  changeAuthPassword({email,password,newpassword})async{
    final cred = EmailAuthProvider.credential(email: email, password: password);
    await currentUser!.reauthenticateWithCredential(cred).then((value){
      currentUser!.updatePassword(newpassword);

    }).catchError((error){
      print(error.toString());
    });
  }

  // getToken() async{
  //   await currentUser!.getIdToken().then(
  //     (token){
  //       var userToken = token;
  //       print(userToken);
  //     });
  // }
}