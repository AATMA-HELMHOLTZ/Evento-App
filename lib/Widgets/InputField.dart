import 'package:flutter/material.dart';

class InputWithIcon extends StatefulWidget {
  final IconData icon;
  final String hint;
  final TextEditingController Controller;
  final bool isPasswordField ;
  InputWithIcon({this.icon, this.hint, this.Controller, this.isPasswordField});

  @override
  _InputWithIconState createState() => _InputWithIconState();
}

class _InputWithIconState extends State<InputWithIcon> {
bool showPassword = true;
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
                suffixIcon: widget.isPasswordField ? IconButton(
                  onPressed: (){
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                ): null,
                  contentPadding: EdgeInsets.symmetric(vertical: 20),
                  border: InputBorder.none,
                  hintText: widget.hint,
              ),
              obscureText: widget.isPasswordField ? showPassword : false,
              controller: widget.Controller,
            ),
          )
        ],
      ),
    );
  }
}
