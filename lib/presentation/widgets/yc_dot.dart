import 'package:flutter/material.dart';

class YCDot extends StatelessWidget {
  final String? title;

  const YCDot({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          'ZEXROSS',
          textScaler: TextScaler.linear(2),
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.orange,
          ),
        ),
        if (title != null) ...[
          SizedBox(width: 5),
          Text(
            title!,
            textScaler: TextScaler.linear(2), // Match "ZEXROSS" scaling
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
      ],
    );
  }
}
