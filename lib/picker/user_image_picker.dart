import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class UserImagePicker extends StatefulWidget {
  const UserImagePicker({Key? key}) : super(key: key);

  @override
  _UserImagePickerState createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
   File? _pickedImage;

  void _pickImage() async{
   final pickImageFile = await ImagePicker().pickImage(source: ImageSource.camera,); // instead of ImagePicker I used ImagePicker()
   setState(() {
     _pickedImage = pickImageFile as File  ;
   });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget> [
      CircleAvatar(
        radius: 40,
        backgroundColor: Colors.grey,
        backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
      ),
      FlatButton.icon(
        textColor: Theme.of(context).primaryColor,
        onPressed: _pickImage,
        icon: Icon(Icons.image),
        label: Text('Add Image'),
      ),
    ],);
  }
}
