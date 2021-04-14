import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:energia_app/components/utili_class.dart';
import 'package:energia_app/widgets/language_swich.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';
import 'package:firebase_database/firebase_database.dart';
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

  var current_uid=FirebaseAuth.instance.currentUser.email.substring(2,13);

  var first_name="name";
  var last_name="name";
  var image_url="NULL";
  var bio="bio";
  var email="email";

  TextEditingController frist_Name_Controler = TextEditingController();
  TextEditingController last_Name_Controler = TextEditingController();
  TextEditingController image_url_Controler = TextEditingController();
  TextEditingController bio_Controler = TextEditingController();
  TextEditingController email_Controler = TextEditingController();




  Widget generateTextField(String hint, TextEditingController controller,) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: TextField(
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
        .doc(current_uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          frist_Name_Controler.text=documentSnapshot.data()['first_name'];
          last_Name_Controler.text=documentSnapshot.data()['last_name'];
          image_url=documentSnapshot.data()['image_url'];
          bio_Controler.text=documentSnapshot.data()['bio'];
          email_Controler.text=documentSnapshot.data()['email'];

        });
      } else {

      }
    }).whenComplete(() {
      if (frist_Name_Controler.text==null){
        setState(() {
          frist_Name_Controler.text="name";
        });
      }
      if (email_Controler.text==null){
        setState(() {
          email_Controler.text="email";
        });
      }
      if (last_Name_Controler.text==null){
        setState(() {
          last_Name_Controler.text="name";
        });
      }
      if (bio_Controler.text==null){
        setState(() {
          bio_Controler.text="bio";
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
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if (!inputChanged&&_pickedProfileImage==null) {
                Toast.show("Data not changed", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              } else {
                HelpFun().startLoading(context);
                if (_pickedProfileImage!=null){
                  uploadImage(_pickedProfileImage);
                }
                else{
                  _sendToServer(image_url);
                }

                ///start loading
                 ///if (image changed)  updata image
                ///updata data
                ///close loading

              }
            },
          )
        ],
        title: Text('Edit Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          :(image_url!="NULL"&&image_url!=null)? NetworkImage(
                             image_url):AssetImage("assets/images/logo.png"),
                    ),
                  ),
                  Positioned(
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
                  ),
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
            generateTextField('first name', frist_Name_Controler),
            generateTextField('last name', last_Name_Controler),

            generateTextField('bio', bio_Controler),
            generateTextField('Email',email_Controler),
          ],
        ),
      ),
    );
  }

  _sendToServer( String url) {
    firestore
        .collection('users')
        .doc(current_uid)
        .update({
      'first_name':frist_Name_Controler.text ,
      'last_name': last_Name_Controler.text,
      'image_url':url ,
      'email':email_Controler.text ,
      'bio': bio_Controler.text,
    }).whenComplete(() {
      HelpFun().closeLoading(context);
      Toast.show("Data saved", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    });

  }

  uploadImage(File image) async {
    StorageReference firebaseStorageRef =
        FirebaseStorage.instance.ref().child(current_uid).child("profile_image")
    .child(DateTime.now().toString());
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(image);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    final url = await firebaseStorageRef.getDownloadURL();

    _sendToServer(url);
  }
}
