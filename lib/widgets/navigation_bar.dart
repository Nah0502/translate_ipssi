import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 20, 48, 70),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        selectedItemColor: const Color.fromARGB(255, 1, 187, 243),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            label: 'Translate',
            icon: Icon(Icons.translate, size: 30, color: Colors.white),
          ),
          BottomNavigationBarItem(
            label: 'Correction',
            icon: Icon(Icons.edit, size: 30, color: Colors.white),
          ),
          BottomNavigationBarItem(
            label: 'Rephraser',
            icon: Icon(Icons.autorenew, size: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
