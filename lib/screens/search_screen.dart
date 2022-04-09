import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:neu_weather/models/recent_search.dart';
import 'package:neu_weather/theme/colors.dart';
import 'package:neu_weather/theme/styles.dart';
import 'package:neu_weather/widgets/widgets_index.dart';

import '../configs/configs_index.dart';
import '../theme/decorations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<RecentSearch> recentSearch = [
    RecentSearch(
      name: 'Surabaya',
      minTemp: 34,
      maxTemp: 23,
    ),
    RecentSearch(
      name: 'Banjarmasin',
      minTemp: 30,
      maxTemp: 21,
    ),
    RecentSearch(
      name: 'Yogyakarta',
      minTemp: 32,
      maxTemp: 21,
    ),
  ];

  Widget buildRecentSearch() {
    final spacing = AppSpacing();
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(spacing.large),
            bottomRight: Radius.circular(spacing.large),
          ) //height: 500,
          ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(spacing.medium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recent searches',
              style: regularText.copyWith(
                color: textFocus,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 21,
            ),
            buildRecetList(),
          ],
        ),
      ),
    );
  }

  Widget buildRecetList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: recentSearch.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final recent = recentSearch.elementAt(index);
        return SizedBox(
          height: 52,
          child: Row(
            children: [
              // const SizedBox(
              //   width: 21,
              // ),
              const Icon(
                EvaIcons.clockOutline,
                color: textFocus,
              ),
              const SizedBox(
                width: 21,
              ),
              Text(
                recent.name,
                style: regularText.copyWith(
                  color: textFocus,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                '${recent.minTemp}° / ${recent.maxTemp}°',
                style: regularText.copyWith(
                  color: textFocus,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final decorations = Decorations();

    return Stack(
      children: [
        Container(
          decoration: decorations.gradientDecoration,
          // // child: Image.asset('assets/map.png'),
          // color: Colors.red,
        ),
        Positioned(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: const CustomTextField(),
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: textFocus,
              automaticallyImplyLeading: false,
            ),
            body: Column(
              children: [
                buildRecentSearch(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
