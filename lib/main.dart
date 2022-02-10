import 'package:flutter/material.dart';
import 'package:musicplayer/pages/app.dart';

void main() {
  runApp(MaterialApp(
    title: 'Music App',
    theme: ThemeData(
      fontFamily: 'Proxima',
      canvasColor: Colors.transparent,
      shadowColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.black,
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.black
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 30.0,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        circularTrackColor: Colors.greenAccent[700],
        color: Colors.greenAccent[400],
        linearMinHeight: 10,
      ),
      textTheme: const TextTheme(
        headline4: TextStyle(
          color: Colors.white,
          fontSize: 23,
          fontFamily: 'Proxima Bold',
          fontWeight: FontWeight.w600,
        ),
        bodyText1: TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      primarySwatch: Colors.blue,
    ),
    home: const App(),
  )
  );
}