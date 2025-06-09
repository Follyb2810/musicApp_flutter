import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final String labelText;
  final TextEditingController textEditingController;
  final String? name;
  final bool? isObscureText;
  const InputField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    this.name,
    this.isObscureText,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  // why not props here
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      obscureText: widget.isObscureText ?? false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        hintText: widget.hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty || value.trim().isEmpty) {
          return 'Please enter ${widget.labelText.toLowerCase()}';
        }
        return null;
      },
    );
  }
}
