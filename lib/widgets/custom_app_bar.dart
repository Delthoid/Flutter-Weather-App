import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:neu_weather/theme/styles.dart';

class CustomAppBarTitle extends StatefulWidget {
  const CustomAppBarTitle({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
    required this.showChevron,
    required this.titleLeadingSpacing,
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget trailing;
  final bool showChevron;
  final double titleLeadingSpacing;

  @override
  State<CustomAppBarTitle> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBarTitle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        widget.leading,
        SizedBox(
          width: widget.titleLeadingSpacing,
        ),
        widget.title,
        const SizedBox(
          width: 18,
        ),
        widget.showChevron
            ? const Icon(EvaIcons.chevronDownOutline)
            : const SizedBox.shrink(),
        const Spacer(),
        widget.trailing,
      ],
    );
  }
}
