import 'package:flutter/material.dart';

class TeacherSettings extends StatefulWidget {
  @override
  _TeacherSettingsState createState() => _TeacherSettingsState();
}

class _TeacherSettingsState extends State<TeacherSettings> {
  bool _notification = true;

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
          ],
        ),
      ),
    );
  }
}
