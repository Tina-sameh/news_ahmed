import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_ahmed/ui/providers/providerLang.dart';
import 'package:news_ahmed/ui/tabs/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_ahmed/ui/tabs/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=> LangProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LangProvider langProvider=Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Spanish
      ],
      locale: Locale(langProvider.currentLocale),
      routes: {
        Home.routeName: (_)=> Home(),
        Splash.routeName: (_)=> Splash(),
      },
      initialRoute:Splash.routeName ,
     );
  }
}
