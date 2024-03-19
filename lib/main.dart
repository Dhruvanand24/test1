import "package:flutter/material.dart";
import "package:test1/design/app_theme.dart";
import "package:test1/features/onboarding/onboarding_page.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      home: Welcome(),
    );
  }
}
