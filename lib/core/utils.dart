import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(content)));
}
Future<File?> pickAudio() async {
  try {
    final filePickResult = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (filePickResult != null && filePickResult.files.isNotEmpty) {
      return File(filePickResult.files.first.path!);
    }
    return null;
  } catch (e) {
    print('Error picking audio file: $e');
    return null;
  }
}
Future<File?> pickImage() async {
  try {
    final filePickResult = await FilePicker.platform.pickFiles(type: FileType.image);
    if (filePickResult != null && filePickResult.files.isNotEmpty) {
      return File(filePickResult.files.first.path!);
    }
    return null;
  } catch (e) {
    print('Error picking audio file: $e');
    return null;
  }
}
