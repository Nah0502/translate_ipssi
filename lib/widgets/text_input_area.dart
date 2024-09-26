import 'package:flutter/material.dart';

class TextInputArea extends StatelessWidget {
  final TextEditingController textController;
  final VoidCallback onSendPressed;

  const TextInputArea({
    Key? key,
    required this.textController,
    required this.onSendPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'the text',
                filled: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
                prefixIcon: const Icon(Icons.translate, color: Colors.grey),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: onSendPressed,
          ),
        ],
      ),
    );
  }
}
