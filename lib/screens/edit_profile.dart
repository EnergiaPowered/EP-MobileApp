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
  Widget generateTextField(String hint, TextEditingController controller) {
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
              margin: EdgeInsets.only(left: 50, right: 10, top: 10, bottom: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [0.1, 0.9],
                      colors: [Theme.of(context).primaryColor, Colors.white])),
            ),
            generateTextField(
                'User name', TextEditingController(text: 'Khlid Ali')),
            generateTextField(
                'About', TextEditingController(text: 'Computer Engineer')),
            generateTextField(
                'User phone', TextEditingController(text: '01123827968')),
            generateTextField('Email',
                TextEditingController(text: 'Khalid.ahmed99@eng-st.cu.edu.eg')),
          ],
        ),
      ),
    );
  }
}
