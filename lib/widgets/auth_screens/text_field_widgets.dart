import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  IconData iconData;
  String text;
  final bool obscureText;

  TextFieldWidget({
    super.key,
    required this.text,
    required this.iconData,
    this.obscureText = false
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.titleSmall,
      cursorColor: Colors.black,
      obscureText: widget.obscureText ? !_isPasswordVisible : false,
      decoration: InputDecoration(
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
        ): null,
        hintText: widget.text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (val) {
      },
    );
  }
}
