import 'package:flutter/material.dart';

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController mailController;
  InputWithIcon({this.icon, this.hint, this.mailController});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB056674),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFB056674),
              )
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint
              ),
              controller: widget.mailController,
            ),
          )
        ],
      ),
    );
  }
}

class PassWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController passwordController;
  PassWithIcon({this.icon, this.hint, this.passwordController});

  @override
  _PassWithIconState createState() => _PassWithIconState();
}

class _PassWithIconState extends State<PassWithIcon> {

  //TextEditingController con = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: Color(0xFFB056674),
              width: 2
          ),
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
              width: 60,
              child: Icon(
                widget.icon,
                size: 20,
                color: Color(0xFFB056674),
              )
          ),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint
              ),
              autofocus: false,
              obscureText: true,
              controller: widget.passwordController,
            ),
          )
        ],
      ),
    );
  }
}