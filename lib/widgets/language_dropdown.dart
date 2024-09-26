import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final String selectedLanguage;
  final List<String> languages;
  final ValueChanged<String?> onChanged;

  const LanguageDropdown({
    Key? key,
    required this.selectedLanguage,
    required this.languages,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: DropdownButtonFormField<String>(
        value: selectedLanguage,
        decoration: InputDecoration(
          labelText: 'Choose a language',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          filled: true,
          fillColor: Colors.grey.shade200,
        ),
        icon: const Icon(Icons.language, color: Colors.blue),
        items: languages.map((String language) {
          return DropdownMenuItem<String>(
            value: language,
            child: Text(language),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
