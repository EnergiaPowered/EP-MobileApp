import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/components/utili_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File _pickedProfileImage;

  bool inputChanged = false;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  var currentUid = FirebaseAuth.instance.currentUser.email.substring(2, 13);

  var firstName = "name";
  var lastName = "name";
  var imageUrl = "NULL";
  var bio = "bio";
  var email = "email";
  bool textFieldEnable = false;

  TextEditingController fristNameControler = TextEditingController();
  TextEditingController lastNameControler = TextEditingController();
  TextEditingController imageUrlControler = TextEditingController();
  TextEditingController bioControler = TextEditingController();
  TextEditingController emailControler = TextEditingController();

  Widget generateTextField(
    String hint,
    TextEditingController controller,
  ) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
        enabled: textFieldEnable,
        onChanged: (value) => inputChanged = true,
        controller: controller,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            labelText: hint,
            hintText: hint,
            border: OutlineInputBorder(),
            alignLabelWithHint: true),
        maxLines: 1,
      ),
    );
  }

  void _pickImage() async {
    // ignore: deprecated_member_use
    final pickedImageFile = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 20);
    setState(() {
      _pickedProfileImage = pickedImageFile;
    });
  }

  @override
  void initState() {
    firestore
        .collection('users')
        .doc(currentUid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          fristNameControler.text = documentSnapshot.data()['first_name'];
          lastNameControler.text = documentSnapshot.data()['last_name'];
          imageUrl = documentSnapshot.data()['image_url'];
          bioControler.text = documentSnapshot.data()['bio'];
          emailControler.text = documentSnapshot.data()['email'];
        });
      } else {}
    }).whenComplete(() {
      if (fristNameControler.text == null) {
        setState(() {
          fristNameControler.text = "name";
        });
      }
      if (emailControler.text == null) {
        setState(() {
          emailControler.text = "email";
        });
      }
      if (lastNameControler.text == null) {
        setState(() {
          lastNameControler.text = "name";
        });
      }
      if (bioControler.text == null) {
        setState(() {
          bioControler.text = "bio";
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          textFieldEnable
              ? IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    if (!inputChanged && _pickedProfileImage == null) {
                      Toast.show("Data not changed", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    } else {
                      HelpFun().startLoading(context);
                      if (_pickedProfileImage != null) {
                        uploadImage(_pickedProfileImage);
                      } else {
                        _sendToServer(imageUrl);
                      }

                      ///start loading
                      ///if (image changed)  updata image
                      ///updata data
                      ///close loading

                    }
                    Navigator.of(context).pop();
                  },
                )
              : SizedBox()
        ],
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            !textFieldEnable
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Edit',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              textFieldEnable = true;
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13.0))),
                              child: Icon(
                                Icons.edit,
                                size: 30,
                                color: Theme.of(context).primaryColor,
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                  )
                : SizedBox(),
            Container(
              padding: EdgeInsets.all(15),
              width: double.infinity,
              child: Center(
                child: Stack(alignment: Alignment.center, children: [
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: const Color(0xFF03144c),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: _pickedProfileImage != null
                          ? FileImage(_pickedProfileImage)
                          : (imageUrl != "NULL" && imageUrl != null)
                              ? NetworkImage(imageUrl)
                              : AssetImage("assets/images/user.png"),
                    ),
                  ),
                  textFieldEnable
                      ? Positioned(
                          bottom: 0,
                          right: 0,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade200,
                            child: IconButton(
                                icon: Icon(
                                  Icons.add_a_photo,
                                  color: const Color(0xFF03144c),
                                ),
                                onPressed: () {
                                  _pickImage();
                                }),
                          ),
                        )
                      : SizedBox()
                ]),
              ),
            ),
            Container(
              width: double.infinity,
              height: 3,
              margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: MediaQuery.of(context).size.width * 1 / 6),
              color: Theme.of(context).primaryColor,
            ),

            /// SwitchLanguage(false),

            /// generateTextField('Password', TextEditingController(text: '********')),
            generateTextField('first name', fristNameControler),
            generateTextField('last name', lastNameControler),

            generateTextField('bio', bioControler),
            generateTextField('Email', emailControler),
          ],
        ),
      ),
    );
  }

  _sendToServer(String url) {
    firestore.collection('users').doc(currentUid).update({
      'first_name': fristNameControler.text,
      'last_name': lastNameControler.text,
      'image_url': url,
      'email': emailControler.text,
      'bio': bioControler.text,
    }).whenComplete(() {
      HelpFun().closeLoading(context);
      Toast.show("Data saved", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    });
  }

  uploadImage(File image) async {
    StorageReference firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child(currentUid)
        .child("profile_image")
        .child(DateTime.now().toString());
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    await uploadTask.onComplete;
    final url = await firebaseStorageRef.getDownloadURL();

    _sendToServer(url);
  }
}
