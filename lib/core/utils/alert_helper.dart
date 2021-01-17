import 'package:flutter/material.dart';

class AlertHelper {
  static showBasicDialog(
    BuildContext _context,
    String message,
  ) async {
    showDialog(
        context: _context,
        builder: (_) => new AlertDialog(
              title: Text(
                "Warning",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              content: Text(message),
              actions: <Widget>[
                FlatButton(
                  child: Text('Kapat'),
                  onPressed: () {
                    Navigator.of(_context).pop();
                  },
                )
              ],
            ));
  }
}
