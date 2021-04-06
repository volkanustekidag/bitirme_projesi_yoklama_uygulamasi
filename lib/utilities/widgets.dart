import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Button extends StatelessWidget {
  final Function onPress;
  final String buttonName;

  const Button({@required this.onPress, @required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        onPressed: onPress,
        elevation: 5.0,
        padding: EdgeInsets.all(15.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        color: Colors.white,
        child: Text(
          '$buttonName',
          style: TextStyle(
            color: Color(0xFF478DE0),
            fontFamily: 'OpenSans',
            fontSize: 20.00,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}

class InputTextBox extends StatelessWidget {
  final String boxTitle;
  final Icon boxIcon;
  final String textHint;
  final Function onChanged;
  final TextInputType textInputType;
  final bool obscureControl;

  const InputTextBox(
      {@required this.boxTitle,
      @required this.onChanged,
      @required this.boxIcon,
      @required this.textHint,
      @required this.textInputType,
      @required this.obscureControl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 8.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF478DE0),
          ),
          height: 60.0,
          child: TextFormField(
            validator: obscureControl
                ? MultiValidator([
                    MinLengthValidator(10, errorText: ''),
                  ])
                : MultiValidator([
                    MinLengthValidator(10,
                        errorText: 'En az 10 karakter girmelisin.'),
                    EmailValidator(
                        errorText: 'Geçerli bir email adresi giriniz.')
                  ]),
            obscureText: obscureControl,
            keyboardType: textInputType,
            style: TextStyle(color: Colors.white),
            onChanged: onChanged,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: boxIcon,
                hintText: textHint,
                hintStyle: TextStyle(
                  color: Colors.white,
                )),
          ),
        ),
      ],
    );
  }
}
