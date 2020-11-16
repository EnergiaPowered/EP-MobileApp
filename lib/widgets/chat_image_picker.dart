import 'dart:io';
import 'package:energia_app/widgets/message_item.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toast/toast.dart';

class ChatImagePicker extends StatefulWidget {
  final Function sendImage;
  ChatImagePicker(this.sendImage);
  @override
  _ChatImagePickerState createState() => _ChatImagePickerState();
}

class _ChatImagePickerState extends State<ChatImagePicker> {
  final picker = ImagePicker();
  Future getImage() async {
    await picker.getImage(source: ImageSource.gallery).then((image) {
      setState(() {
        if (Image == null) {
          Toast.show('No Image Selected', context);
        } else {
          //Toast.show(image.path, context);
          widget.sendImage(image.path, MessageType.IMAGE);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(5),
      icon: Icon(
        Icons.camera_alt,
        size: 35,
        color: Colors.grey,
      ),
      onPressed: getImage,
    );
  }
}
