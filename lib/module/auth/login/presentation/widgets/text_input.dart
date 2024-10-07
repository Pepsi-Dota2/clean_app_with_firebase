import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String header;

  const TextInput({
    super.key,
    required this.controller,
    required this.hintText,
    required this.header,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            widget.header,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          focusNode: _focusNode,
          controller: widget.controller,
          autofocus: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            hintText: widget.hintText,
          ),
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "This Field cannot be empty!";
            }
            return null;
          },
        ),
      ],
    );
  }
}
