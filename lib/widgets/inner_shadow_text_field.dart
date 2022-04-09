import 'package:flutter/material.dart';
import 'package:neu_weather/theme/colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({Key? key}) : super(key: key);

  @override
  State<CustomTextField> createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Colors.white,
            Colors.white,
            Colors.white,
            Color(0xFFe6dfd8),
            //Color(0xFFf7f5ec),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          //stops: [0.0, 0.4],
          tileMode: TileMode.clamp,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
      ),
      child: TextField(
        expands: false,
        style: const TextStyle(fontSize: 20.0, color: Colors.black54),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12.0),
          prefixIcon: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              color: textFocus,
            ),
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: textFocus,
          ),
          hintText: 'Search here',
          hintStyle: const TextStyle(color: Colors.black54),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
