import 'package:flutter/material.dart';
import 'package:news_ahmed/ui/providers/providerLang.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    LangProvider langProvider = Provider.of(context);
    String selectedLang = "en";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(12),
        child: DropdownButton(
            value: selectedLang,
            items: const [
              DropdownMenuItem(
                  value: "en",
                  child: Text(
                    "English",
                  )),
              DropdownMenuItem(value: "ar", child: Text("العربيه"))
            ],
            isExpanded: true,
            onChanged: (newValue) {
              selectedLang = newValue!;
              langProvider.setCurrentLocale(selectedLang);
              setState(() {});
            }),
      ),
    );
  }
}
