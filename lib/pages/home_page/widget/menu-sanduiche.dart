import 'package:flutter/material.dart';

class MenuSanduiche extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 5,
            ),
            child: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
