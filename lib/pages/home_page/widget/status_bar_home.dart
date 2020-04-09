import 'package:flutter/material.dart';

class StatusBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double statusBarWidth = MediaQuery.of(context).padding.top;
    return Container(
      height: statusBarWidth,
    );
  }
}
