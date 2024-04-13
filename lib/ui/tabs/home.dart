import 'package:flutter/material.dart';
import 'package:news_ahmed/model/appLocalization_utils.dart';
import 'package:news_ahmed/ui/search/search.dart';
import 'package:news_ahmed/ui/tabs/news/tabs_list.dart';
import 'package:news_ahmed/ui/tabs/settings/settingsTab.dart';
import '../../model/category.dart';
import '../collections/appColors.dart';
import 'category/categoryTab.dart';
class Home extends StatefulWidget {
  static String routeName = "home";
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Categorys? category;
  late Widget body;
  late String page= "category";
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    body = CategrysTab(onCategoryClick: onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: AppBar(
                actions: [
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: InkWell(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: CustomSearchDelegate());
                          },
                          child: const Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.white,
                          ))),
                ],
                title: Text(
                  PageName(),
                  style: const TextStyle(color: Colors.white),
                ),
                centerTitle: true,
                backgroundColor: AppColors.green,
              ),
            ),
          ),
          drawer: Drawer(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .25,
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: AppColors.green,
                  child:  Center(
                      child: Text(
                        context.l10n.newsApp,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      page="category";
                      setState(() {
                        body = CategrysTab(onCategoryClick: onCategoryClick);
                        Navigator.pop(context);
                      });
                    },
                    child:  Row(
                      children: [
                        Icon(
                          Icons.format_list_bulleted_sharp,
                          size: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.l10n.category,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        page="settings";
                        body = SettingsTab();
                        Navigator.pop(context);
                      });
                    },
                    child:  Row(
                      children: [
                        const Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          context.l10n.settings,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: body),
    );
  }

  void onCategoryClick(Categorys category) {
    setState(() {
      this.category = category;
      body = TabsList(categoryId: category.id);
    });
  }

  String PageName() {
    if (category?.title == "Sports") {
      return context.l10n.sports;
    } else if (category?.title == "Science") {
      return context.l10n.science;
    } else if (category?.title == "Technology") {
      return context.l10n.technology;
    } else if (category?.title == "Health") {
      return context.l10n.health;
    } else if (category?.title == "Business") {
      return context.l10n.bussiness;
    } else if (category?.title == "Entertaiment") {
      return context.l10n.entertainment ;
    }
    else if(page=="settings" ){
      return context.l10n.settings;
    }else{
      return context.l10n.category;
    }
  }
}
