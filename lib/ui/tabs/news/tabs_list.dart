import 'package:flutter/material.dart';
import 'package:news_ahmed/data/api_manager.dart';
import 'package:news_ahmed/ui/tabs/news/tab_details.dart';

import '../../../model/SourcesResponse.dart';
import '../../collections/appColors.dart';
import '../../widgets/app_error.dart';
import '../../widgets/app_loader.dart';

class TabsList extends StatefulWidget {
  final String categoryId;

  const TabsList({super.key, required this.categoryId});

  @override
  State<TabsList> createState() => _TabsListState();
}

class _TabsListState extends State<TabsList> {
  int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.LoadTabsList(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppError(
              error: snapshot.error.toString(),
            );
          } else if (snapshot.hasData) {
            return tabsList(snapshot.data.sources);
          } else {
            return AppLoader();
          }
        });
  }

  Widget tabsList(List<Sources> sources) {
    return DefaultTabController(
      length: sources.length,
      child: Column(
        children: [
          TabBar(
            tabs: sources.map((source) {
              return tabWidget(
                  source, currentTabIndex == sources.indexOf(source));
            }).toList(),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (newTabIndex) {
              setState(() {
                currentTabIndex = newTabIndex;
              });
            },
          ),
          Expanded(
            child: TabBarView(
              children: sources
                  .map((source) => TabDetails(sourceId: source.id!))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

Widget tabWidget(Sources source, bool isSelected) {
  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.green, width: 1),
        color: isSelected ? AppColors.green : Colors.white),
    child: Text(
      source.name ?? 'unKnown',
      style: TextStyle(color: isSelected ? Colors.white : AppColors.green),
    ),
  );
}
