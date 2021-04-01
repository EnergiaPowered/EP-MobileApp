
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/components/utili_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


import 'package:toast/toast.dart';


class SendImage extends StatefulWidget {
  var channelId,current_email,current_uid;
  String other_uid;
  SendImage(this.current_uid,this.channelId,this.current_email,this.other_uid);
  @override
  _SendImageState createState() => _SendImageState(channelId,current_email);
}

class _SendImageState extends State<SendImage> {
  var channelId, current_email;

  _SendImageState(this.channelId, this.current_email);

  var appcolor = Color(0xFF03144c);
  File Send_Image;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String playerId = "";

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.add_a_photo),
        color: appcolor,
        iconSize: 40,
        onPressed: () {
          _SendImage();
        });
  }

  void _SendImage() async {
    // ignore: deprecated_member_use
    final picker = ImagePicker();
      await picker.getImage(source: ImageSource.gallery).then((image) {
        setState(() {
          if (Image == null) {
            Toast.show('No Image Selected', context);
          } else {
            //Toast.show(image.path, context);
            check_photo(image.path);
          }
        });
      });

   /* if (pickedImageFile != null) {
      setState(() {
        Send_Image = pickedImageFile;
        showGeneralDialog(
            context: context,
            barrierDismissible: true,
            barrierLabel:
            MaterialLocalizations
                .of(context)
                .modalBarrierDismissLabel,
            barrierColor: Colors.black45,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (BuildContext buildContext, Animation animation,
                Animation secondaryAnimation) {
              return Center(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width - 10,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height - 250,
                  padding: EdgeInsets.all(20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width - 10,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height - 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: FileImage(Send_Image),
                            fit: BoxFit.fill,
                          ),
                          //shape: BoxShape.circle,
                        ),
                      ),
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          uploadIage(Send_Image);
                        },
                        child: Text(
                          "Send",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: const Color(0xFF1BC0C5),
                      )
                    ],
                  ),
                ),
              );
            });
      });
    }*/
  }
  void check_photo(String path){

    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
        MaterialLocalizations
            .of(context)
            .modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Center(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 10,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 250,
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: MediaQuery.of(context).size.height - 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: FileImage(File(path)),
                        fit: BoxFit.fill,
                      ),
                      //shape: BoxShape.circle,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {

                      sendImage(path);
                    },
                    child: Text(
                      "Send",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: const Color(0xFF1BC0C5),
                  )
                ],
              ),
            ),
          );
        });
  }

  sendImage(String path) async {
    Navigator.pop(context);

    HelpFun().startLoading(context);


    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('${auth.currentUser.uid}/chats')
        .child(channelId)
        .child(DateTime.now().toString());
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(File(path));

    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final url = await firebaseStorageRef.getDownloadURL();

        firestore
            .collection('ChatChannel')
            .doc(channelId)
            .collection('messages')
            .add({
          'message': url,
          'type': 'image',
          'data': DateTime.now().toIso8601String().toString(),
          'sederEmail': current_email,
        }).then((value) {

          HelpFun().closeLoading(context);
        }).whenComplete(() {
          ///Notification_1   تم ارسال صوره من from master to  {widget.current_uid}

        });

  }
 /* uploadIage(File image) async {
    Navigator.of(context).pop();
    HelpFun().startLoading(context);
    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('${auth.currentUser.uid}/chats')
        .child(channelId)
        .child(DateTime.now().toString());
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);

    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final url = await firebaseStorageRef.getDownloadURL();
    firestore
        .collection('ChatChannel')
        .doc(channelId)
        .collection('messages')
        .add({
      'message': url,
      'type': 'image',
      'data': DateTime.now().toIso8601String().toString(),
      'sederEmail': current_email,
    }).then((value) {
      Send_Image = null;
      HelpFun().closeLoading(context);
    }).whenComplete(() {
      ///Notification_1   تم ارسال صوره من from master to  {widget.current_uid}

    });
  }*/

}