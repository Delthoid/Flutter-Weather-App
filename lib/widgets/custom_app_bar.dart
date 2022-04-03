import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CustomAppBarTitle extends StatefulWidget {
  const CustomAppBarTitle({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget trailing;

  @override
  State<CustomAppBarTitle> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [
        Icon(EvaIcons.pinOutline),
        SizedBox(
          width: 18,
        ),
        Text(
          'Manila',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 18,
        ),
        Icon(EvaIcons.chevronDownOutline),
        Spacer(),
        Icon(EvaIcons.bellOutline),
      ],
    );
  }
}
