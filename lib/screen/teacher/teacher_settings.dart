import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoklama/module/theme_data_modal.dart';

class TeacherSettings extends StatefulWidget {
  @override
  _TeacherSettingsState createState() => _TeacherSettingsState();
}

class _TeacherSettingsState extends State<TeacherSettings> {
  bool _notification = true;
  bool _themeSelection = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Provider.of<ThemeDataModal>(context, listen: false).getThemeData ==
        ThemeData.dark()) _themeSelection = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ayarlar',
          style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text("Hakkında"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text("Uygulama Bildirimleri"),
                value: _notification,
                onChanged: (bool value) {
                  setState(() {
                    _notification = value;
                    print(_notification);
                  });
                },
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text("E-Mail Bildirimleri"),
                value: _notification,
                onChanged: (bool value) {
                  setState(() {
                    _notification = value;
                    print(_notification);
                  });
                },
              ),
            ),
            Card(
              child: SwitchListTile(
                title: Text("Tema Seçimi"),
                value: _themeSelection,
                onChanged: (bool value) {
                  setState(() {
                    _themeSelection = value;
                    if (value == false) {
                      print("aaa");
                      Provider.of<ThemeDataModal>(context, listen: false)
                          .setThemeData(ThemeData.dark());
                    } else {
                      print("a");
                      Provider.of<ThemeDataModal>(context, listen: false)
                          .setThemeData(ThemeData.light());
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
