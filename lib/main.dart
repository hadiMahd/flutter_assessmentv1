import 'package:flutter/material.dart';
import 'user_feedback_page.dart';

void main() => runApp(UserFeedbackApp());

class UserFeedbackApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserFeedbackPage(),
    );
  }
}
