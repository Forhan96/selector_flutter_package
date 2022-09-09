import 'package:flutter/material.dart';
import 'package:selection_dialogs/country_convert.dart';
import 'package:selection_dialogs/country_selector_dialog.dart';
import 'package:selection_dialogs/gender_selector_dialog.dart';
import 'package:selection_dialogs/language_convert.dart';
import 'package:selection_dialogs/language_selector_dialog.dart';
import 'package:selection_dialogs/models/country.dart';
import 'package:selection_dialogs/models/language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LanguageSelector(
                      onTap: (LanguageData item) {
                        print("${item.name}---${item.locale}---${item.flag}---${item.nativeName}");
                        // Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              child: Text("Language"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return GenderSelector(
                      onTap: (item) {
                        print("----------------$item");
                        // Navigator.pop(context);
                      },
                    );
                  },
                );
              },
              child: Text("Gender"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CountrySelector(
                      onTap: (Country country) {
                        print("${country.name}---${country.isoCode}");
                      },
                    );
                  },
                );
              },
              child: Text("Country"),
            ),
            ElevatedButton(
              onPressed: () {
                String code = CountryConvert().nameToCode("Bangladesh");
                print(code);
              },
              child: Text("Country Name to Code"),
            ),
            ElevatedButton(
              onPressed: () {
                String code = CountryConvert().codeToName("BD");
                print(code);
              },
              child: Text("Country Code to Name"),
            ),
            ElevatedButton(
              onPressed: () {
                String name = LanguageConvert().codeToName("bn");
                print(name);
              },
              child: Text("Language Code to Name"),
            ),
            ElevatedButton(
              onPressed: () {
                String code = LanguageConvert().nameToCode("Bengali");
                print(code);
              },
              child: Text("Language Name to Code"),
            ),
          ],
        ),
      ),
    );
  }
}
