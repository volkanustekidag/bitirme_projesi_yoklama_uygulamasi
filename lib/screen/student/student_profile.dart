import 'package:flutter/material.dart';
import 'package:yoklama/utilities/constants.dart';

class StudentProfile extends StatelessWidget {
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
                  child: Text("Volkan Üstekidağ",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
                Positioned(
                  top: 95,
                  left: 150,
                  child: Text("Bilgisayar Mühendisliği",
                      style: TextStyle(fontSize: 15, color: Colors.white)),
                ),
                Positioned(
                  bottom: 0,
                  child: Hero(
                    tag: "volkan",
                    child: Container(
                      width: 120,
                      height: 120,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('images/volkan.jpg'))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "Volkan Üstekidağ",
              ),
              leading: Icon(Icons.person),
            ),
          ),
          Card(
            child: ListTile(
              title: Text(
                "02170201039@inonu.edu.tr",
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
