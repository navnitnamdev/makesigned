import 'package:flutter/material.dart';




void linee() {
  String s= "program";
//  var i = s.length();

}



class Programs extends StatefulWidget {
  const Programs({super.key});

  @override
  State<Programs> createState() => _ProgramsState();
}

class _ProgramsState extends State<Programs> {

  @override
  void initState() {
    linee();

    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(""),),
    );
  }
}
