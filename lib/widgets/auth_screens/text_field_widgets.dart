import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  IconData iconData;
  String text;
  final bool obscureText;
  TextEditingController textInputController;
  String errorText;

  TextFieldWidget({
    Key? key,
    required this.text,
    required this.iconData,
    this.obscureText = false,
    required this.textInputController,
    this.errorText = '',
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isPasswordVisible = false; // Track whether there is an error

  @override
  Widget build(BuildContext context) {
    bool hasError = widget.errorText.isNotEmpty;
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      cursorColor: Colors.black,
      controller: widget.textInputController,
      obscureText: widget.obscureText ? !_isPasswordVisible : false,
      decoration: InputDecoration(
        labelText: widget.text,
        labelStyle: Theme.of(context).textTheme.bodySmall,
        filled: true,
        fillColor: Colors.white54,
        prefixIcon: Icon(
          widget.iconData,
          color: Colors.black54,
          size: 20,
        ),
        suffixIcon: widget.obscureText
            ? IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
            size: 20,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
        hintText: widget.text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red), // Set the error border color to red
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (val) {
        setState(() {
          hasError = widget.errorText.isNotEmpty; // Set hasError based on errorText
        });
      },
    );
  }
}
