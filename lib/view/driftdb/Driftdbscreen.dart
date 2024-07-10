import 'package:flutter/material.dart';
import 'package:signed/view/driftdb/Driftdatabase.dart';

import '../../PreferenceUtils/CustomAppBar.dart';
import '../Localdata.dart';

class Driftdbscreen extends StatefulWidget {
  const Driftdbscreen({super.key});

  @override
  State<Driftdbscreen> createState() => _DriftdbscreenState();
}

class _DriftdbscreenState extends State<Driftdbscreen> {
  final Driftdatabase _db = Driftdatabase();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: CustomAppBar(
        showBackButton: true, title: "Drift db inserdata", actions: [],


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.black,
              controller: _nameController,

              maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(Icons.favorite),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),

                suffixIcon: Icon(
                  Icons.check_circle,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6200EE)),
                ),
              ),
            ), TextFormField(
              cursorColor: Colors.black,
              controller: _mobileController,
              maxLength: 20,
              decoration: InputDecoration(
                icon: Icon(Icons.favorite),
                labelText: 'mobile number',
                labelStyle: TextStyle(
                  color: Color(0xFF6200EE),
                ),

                suffixIcon: Icon(
                  Icons.check_circle,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF6200EE)),
                ),
              ),
            ),


            ElevatedButton(onPressed: () {
              _insertUser(
                _nameController.text,
                _mobileController.text,
              );
            }, child: Text("submit"))

          ],
        ),
      ),
    );
  }

  Future<void> _insertUser(String name, String mobile) async {
    final insertedUserId = await _db.insertUser(name, mobile);
    _nameController.clear();
    _mobileController.clear();
    _showMessage('User inserted with ID: $insertedUserId');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}