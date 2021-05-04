import 'package:flutter/material.dart';
import 'package:yoklama/services/auth.dart';
import 'package:yoklama/utilities/constants.dart';
import 'package:yoklama/utilities/widgets.dart';

class ForgotPassView extends StatefulWidget {
  @override
  _ForgotPassViewState createState() => _ForgotPassViewState();
}

String email;

class _ForgotPassViewState extends State<ForgotPassView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Background(),
          Container(
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 40,
              ),
              child: Column(
                children: <Widget>[
                  BackScreenIconButton(),
                  SizedBox(
                    height: 40,
                  ),
                  ForgotPassTitleText(),
                  SizedBox(
                    height: 15,
                  ),
                  EmailPassInputTextBox(),
                  SizedBox(
                    height: 15,
                  ),
                  Button(
                      buttonName: "Şifremi Sıfırla",
                      onPress: () {
                        Authentication authentication = new Authentication();
                        authentication.forgotPassword(email);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class EmailPassInputTextBox extends StatelessWidget {
  const EmailPassInputTextBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputTextBox(
        onChanged: (val) {
          email = val;
        },
        boxIcon: Icon(
          Icons.mail,
          color: Colors.white,
        ),
        textHint: "E-Mail",
        textInputType: TextInputType.emailAddress,
        obscureControl: false);
  }
}

class ForgotPassTitleText extends StatelessWidget {
  const ForgotPassTitleText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Şifremi Unuttum",
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'OpenSans',
        fontSize: 25.0,
      ),
    );
  }
}

class BackScreenIconButton extends StatelessWidget {
  const BackScreenIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: linearGradientBox);
  }
}
