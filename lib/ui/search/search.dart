import 'package:flutter/material.dart';



class CustomSearchDelegate extends SearchDelegate {
  static List<String> searshcatgory = [
    "sports",
    "technology",
    "healthy",
    "business",
    "entertainment",
    "science"
  ];


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searshcatgory) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var category in searshcatgory) {
      if (category.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(category);
      }
    }
    return ListView.builder(
        itemCount:matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: InkWell(
                onTap: (){},
                child: Text(result)),
          );
        });
  }
}
