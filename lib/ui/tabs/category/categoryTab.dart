import 'package:flutter/material.dart';
import 'package:news_ahmed/model/appLocalization_utils.dart';
import 'package:news_ahmed/model/category.dart';
import 'package:news_ahmed/ui/collections/appAssets.dart';
import 'package:news_ahmed/ui/widgets/app_category.dart';

class CategrysTab extends StatelessWidget {
  final void Function(Categorys) onCategoryClick;
  static String routeName = "category";

  const CategrysTab({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppAssets.bg1))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                context.l10n.message,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xff4e5968),
                    fontSize: 28),
              ),
              SizedBox(
                height: 5,
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: Categorys.categories.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 25,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            onCategoryClick(Categorys.categories[index]);
                          },
                          child: AppCategory(
                              category: Categorys.categories[index]));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
