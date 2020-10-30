import 'package:energia_app/widgets/language_swich.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class EditProfile extends StatefulWidget {
  static const String routeName = '/edit-profile';
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool inputChanged = false;
  //TODO get profile data using the uid
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              if (!inputChanged) {
                Toast.show("Data not changed", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
              } else {
                Toast.show("Data saved", context,
                    duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
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
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
                      ),
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
                          onPressed: () {}),
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
            SwitchLanguage(false),
            generateTextField(
                'Password', TextEditingController(text: '********')),
            generateTextField(
                'About', TextEditingController(text: 'Computer Engineer')),
              generateTextField('Email',
                TextEditingController(
                  text: 'Khalid.ahmed99@eng-st.cu.edu.eg')),
          ],
        ),
      ),
    );
  }
}
