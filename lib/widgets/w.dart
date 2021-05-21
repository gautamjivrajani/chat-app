import 'package:flutter/material.dart';

class button1 extends StatelessWidget {
  button1({this.title, this.c, @required this.onPressed});
  final Color c;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: c,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}

class box extends StatelessWidget {
  box({this.hinttext, this.co, @required this.onChanged});
  final String hinttext;
  final Color co;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hinttext,
        hintStyle: Theme.of(context).textTheme.caption.copyWith(
              color: Colors.white,
              fontSize: 15.0,
            ),
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: co, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: co, width: 3.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
