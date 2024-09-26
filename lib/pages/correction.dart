import 'package:flutter/material.dart';
import 'package:translate_ipssi/services/groq.dart';
import 'package:translate_ipssi/widgets/language_dropdown.dart';
import 'package:translate_ipssi/widgets/text_input_area.dart';
import 'package:translate_ipssi/widgets/navigation_bar.dart' as custom;

class MyCorrectionPage extends StatefulWidget {
  const MyCorrectionPage({super.key});

  @override
  State<MyCorrectionPage> createState() => _MyCorrectionPageState();
}

class _MyCorrectionPageState extends State<MyCorrectionPage> {
  final List<String> _languages = ['Anglais', 'Français', 'Espagnol', 'Arabe', 'Chinois'];
  String _selectedLanguage = 'Anglais';
  final List<Map<String, String>> _messages = [];
  final TextEditingController _textController = TextEditingController();

  Future<dynamic> getData() async {
    dynamic groqService = await GroqService().getData();
    return groqService;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CORRECTION'),
        backgroundColor: const Color.fromARGB(255, 20, 48, 70),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          LanguageDropdown(
            selectedLanguage: _selectedLanguage,
            languages: _languages,
            onChanged: (String? newValue) {
              setState(() {
                _selectedLanguage = newValue!;
              });
            },
          ),
          Expanded(child: messagesListView()),
          TextInputArea(
            textController: _textController,
            onSendPressed: () {
              if (_textController.text.isNotEmpty) {
                setState(() {
                  _messages.add({
                    'text': _textController.text,
                    'sender': 'user',
                  });
                  _messages.add({
                    'text': 'Response of IA "${_textController.text}"',
                    'sender': 'ai',
                  });
                  _textController.clear();
                });
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: const custom.NavigationBar(),
    );
  }

  Widget messagesListView() {
    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
          child: Align(
            alignment: message['sender'] == 'user' ? Alignment.centerRight : Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: message['sender'] == 'user' ? Colors.blue.shade100 : Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                message['text'] ?? '',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }
}
