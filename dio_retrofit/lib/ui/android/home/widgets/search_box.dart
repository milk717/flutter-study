import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  VoidCallback submitButton;

  SearchBox({Key? key, required this.submitButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Flexible(child: TextField(
            controller: ,
          ), flex: 9),
          Flexible(flex: 1, child: IconButton(
            icon: Icon(Icons.send),
            onPressed: () => submitButton() ,
          ))
        ],
      ),
    );
  }
}
