import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MasyarakatRegisterPage extends StatefulWidget {
  const MasyarakatRegisterPage({super.key});

  @override
  State<MasyarakatRegisterPage> createState() => _MasyarakatRegisterPageState();
}

class _MasyarakatRegisterPageState extends State<MasyarakatRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => {Navigator.pop(context)},
          child: Text('back'),
        ),
      ),
    );
  }
}
