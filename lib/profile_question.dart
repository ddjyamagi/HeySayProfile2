import 'package:flutter/material.dart';

class ProfileQuestion extends StatelessWidget {
  final String question;
  final Color backgroundColor;

  ProfileQuestion({required this.question, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: 16),
          child: Text(
            question,
            style: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'Madou'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            style: TextStyle(color: Colors.white, fontFamily: 'Madou'),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}