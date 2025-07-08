import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:musicapp/core/theme/color_pallete.dart';
import 'package:musicapp/core/utils.dart';
import 'package:musicapp/core/widget/input_field.dart';

class UploadSongPage extends ConsumerStatefulWidget {
  const UploadSongPage({super.key});

  @override
  ConsumerState<UploadSongPage> createState() => _UploadSongPageState();
}

class _UploadSongPageState extends ConsumerState<UploadSongPage> {
  final artistController = TextEditingController();
  final songNameController = TextEditingController();
  Color selectedColor = ColorPallete.cardColor;
  File? selectedImage;
  File? selectedAudio;

  void selectAudio() async {
    final pickedAudio = await pickAudio();
    if (pickedAudio != null) {
      setState(() {
        selectedAudio = pickedAudio;
      });
    }
  }

  void selectImage() async {
    final pickedImage = await pickImage();
    if (pickedImage != null) {
      setState(() {
        selectedImage = pickedImage;
      });
    }
  }

  @override
  void dispose() {
    artistController.dispose();
    songNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Song'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: selectImage,
                child: selectedImage != null
                    ? SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            selectedImage!,
                            fit: BoxFit.contain,
                          ),
                        ),
                      )
                    : DottedBorder(
                        options: RectDottedBorderOptions(
                          color: ColorPallete.borderColor,

                          dashPattern: const [10, 4],
                          strokeWidth: 2,
                          // borderType: BorderType.RRect,
                          // radius: const Radius.circular(10),
                        ),
                        child: Container(
                          height: 150,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.folder_open, size: 40),
                              SizedBox(height: 15),
                              Text(
                                'Select Thumbnail for your song',
                                style: TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 30),
              InputField(
                hintText: 'Pick Song',
                labelText: 'Pick Song',
                isReadonly: true,
                textEditingController: null,
                onTap: selectAudio,
              ),
              const SizedBox(height: 20),
              InputField(
                hintText: 'Artist Name',
                labelText: 'Artist Name',
                textEditingController: artistController,
              ),
              const SizedBox(height: 20),
              InputField(
                hintText: 'Song Name',
                labelText: 'Song Name',
                textEditingController: songNameController,
              ),
              const SizedBox(height: 20),
              // ColorPicker(),
              ColorPicker(
                color: selectedColor,
                pickersEnabled: {ColorPickerType.wheel: true},
                heading: Text('Select Color'),
                onColorChanged: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
