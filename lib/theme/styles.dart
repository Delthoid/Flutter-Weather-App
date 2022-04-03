import 'package:flutter/material.dart';

TextStyle textShadowStyle =  const TextStyle(
    shadows: <Shadow>[
      Shadow(
        offset: Offset(-2, 3),
        blurRadius: 1.0,
        color: Color.fromARGB(10, 0, 0, 0),
      ),
    ]
  );

TextStyle regularText = textShadowStyle.copyWith(
  fontSize: 18,
  color: Colors.white,
);

TextStyle bigText =  const TextStyle(
  fontSize: 100,
  color: Colors.white,
  shadows: <Shadow>[
    Shadow(
        offset: Offset(-2, 3),
        blurRadius: 50.0,
        color: Color.fromARGB(10, 0, 0, 0),
        //color: Colors.,re
      ),
  ]
);