import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherProfile extends StatefulWidget {
  @override
  _TeacherProfileState createState() => _TeacherProfileState();
}

class _TeacherProfileState extends State<TeacherProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profil',
          style: TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.bold),
        ),
        backgroundColor: kBlueFontToune,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.20,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: double.infinity,
                  color: kBlueFontToune,
                ),
                Positioned(
                  top: 70,
                  left: 150,
                  child: Text("Ali ARI",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Positioned(
                  top: 95,
                  left: 150,
                  child: Text("Doç. Dr. Öğrt. Görv.",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: 120,
                    height: 120,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                'https://i.hizliresim.com/kEpByj.jpg'))),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Ali Arı",
              ),
              leading: Icon(Icons.person),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "ali.ari@inonu.edu.tr",
              ),
              leading: Icon(Icons.email),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "*************",
              ),
              leading: Icon(Icons.lock_rounded),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "*************",
              ),
              leading: Icon(Icons.lock_rounded),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
