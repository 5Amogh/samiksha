import 'package:flutter/material.dart';

class TextInputCard extends StatefulWidget {
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController controller;

  const TextInputCard({
    Key? key,
    required this.labelText,
    required this.prefixIcon,
    required this.controller,
  }) : super(key: key);

  @override
  _TextInputCardState createState() => _TextInputCardState();
}

class _TextInputCardState extends State<TextInputCard> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (hasFocus) {
        setState(() {
          isFocused = hasFocus;
        });
      },
      child: Card(
        elevation: isFocused ? 8.0 : 0.0,
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: widget.prefixIcon,
          ),
        ),
      ),
    );
  }
}
