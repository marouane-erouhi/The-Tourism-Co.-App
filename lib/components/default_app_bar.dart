import 'package:flutter/material.dart';
import '../styles.dart';

class DefaultAppBar extends AppBar{
  @override
  final Widget title = Text('Tourism & Co.'.toUpperCase(), style: Styles.navBarTitle);
  @override
  final bool centerTitle = true;
  @override
  final double elevation = 0.5;
  @override
  final IconThemeData iconTheme = IconThemeData(color: Colors.black);
  @override
  final Color backgroundColor = Colors.white;

}