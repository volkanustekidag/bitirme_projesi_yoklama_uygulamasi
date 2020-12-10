import 'package:flutter/material.dart';
import 'package:flutter_unicons/unicons.dart';
import 'package:yoklama/utilities/constants.dart';

class TeacherNotification extends StatefulWidget {
  @override
  _TeacherNotificationState createState() => _TeacherNotificationState();
}

class _TeacherNotificationState extends State<TeacherNotification> {
  String postContent;

  List<String> post = [
    "Bitirme Projesi için bu hafta sunum yapılmayacaktır. Sınav dolayısıyla sunumu haftaya erteledik. \n\n Saygılarımla"
  ];
  final GlobalKey<AnimatedListState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                    offset: Offset(4, 4),
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 10,
                    spreadRadius: 2)
              ]),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            color: Colors.white,
            child: Row(children: <Widget>[
              CircleAvatar(
                maxRadius: 15,
                minRadius: 15,
                child: Icon(Icons.person),
                //  backgroundImage: AssetImage("images/logo.png")
              ),
              SizedBox(
                width: 8,
              ),
              Text("Dersle ilgili bir şeyler paylaşın...",
                  style: TextStyle(color: Colors.grey, fontSize: 16)),
            ]),
            onPressed: () {
              sheetBottom(context);
            },
          ),
        ),
        Expanded(
          child: AnimatedList(
              key: key,
              initialItemCount: post.length,
              itemBuilder: (context, index, animation) {
                return buildItem(post[index]);
              }),
        )
      ],
    ));
  }

  Future sheetBottom(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height - 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.close,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          key.currentState.insertItem(0);
                          Navigator.pop(context);
                          post.add(postContent);
                        },
                        child: Text("+Paylaş",
                            style:
                                TextStyle(fontSize: 20, color: kBlueFontToune)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 5,
                    ),
                    CircleAvatar(
                      maxRadius: 15,
                      minRadius: 15,
                      child: Icon(Icons.person),
                      //  backgroundImage: AssetImage("images/logo.png")
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text("Ali Arı")
                  ],
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  child: TextField(
                    onChanged: (values) {
                      postContent = values;
                    },
                    maxLines: 25,
                    minLines: 20,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Duyuru hakkında bir şeyler yaz..."),
                  ),
                )
              ],
            ),
          );
        });
  }
}

Widget buildItem(String item) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Card(
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text('Ali Arı'),
        trailing: Icon(Icons.arrow_forward_ios),
        subtitle: Text(item),
      ),
    ),
  );
}

katilimBox() {
  return Container(
    width: double.infinity,
    height: 60,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(4, 4))
        ],
        color: Color(0xFF73AEF5),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0))),
    child: Center(
        child: Column(
      children: <Widget>[
        Text(
          'Ders Katılım Kodu',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              color: Colors.white,
              fontSize: 20),
        ),
        Text(
          'A 3 2 S D F 2',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
              color: Colors.white,
              fontSize: 20),
        ),
      ],
    )),
  );
}
