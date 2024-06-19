import 'package:flutter/material.dart';
import 'package:signed/practise/Statemodal.dart';

class Practise extends StatefulWidget {
  const Practise({super.key});

  @override
  State<Practise> createState() => _PractiseState();
}

class _PractiseState extends State<Practise> {
  final Map<String, dynamic> statesData = {
    "andhrapradesh": {
      "code": "ap",
      "name": "Andhra Pradesh"
    },
    "arunachalpradesh": {
      "code": "ar",
      "name": "Arunachal Pradesh"
    },
    "assam": {
      "code": "as",
      "name": "Assam"
    },
    "bihar": {
      "code": "br",
      "name": "Bihar"
    },
    "chandigarh": {
      "code": "ch",
      "name": "Chandigarh"
    },
    "chhattisgarh": {
      "code": "ct",
      "name": "Chhattisgarh"
    },
    "dadraandnagarhavelianddamananddiu": {
      "code": "dn",
      "name": "Dadra and Nagar Haveli and Daman and Diu"
    },
    "delhi": {
      "code": "dl",
      "name": "Delhi"
    },
    "goa": {
      "code": "ga",
      "name": "Goa"
    },
    "gujarat": {
      "code": "gj",
      "name": "Gujarat"
    },
    "haryana": {
      "code": "hr",
      "name": "Haryana"
    },
    "himachalpradesh": {
      "code": "hp",
      "name": "Himachal Pradesh"
    },
    "jammukashmir": {
      "code": "jk",
      "name": "Jammu and Kashmir"
    },
    "jharkhand": {
      "code": "jh",
      "name": "Jharkhand"
    },
    "karnataka": {
      "code": "ka",
      "name": "Karnataka"
    },
    "kerala": {
      "code": "kl",
      "name": "Kerala"
    },
    "ladakh": {
      "code": "ld",
      "name": "Ladakh"
    },
    "lakshadweep": {
      "code": "la",
      "name": "Lakshadweep"
    },
    "madhyapradesh": {
      "code": "mp",
      "name": "Madhya Pradesh"
    },
    "maharashtra": {
      "code": "mh",
      "name": "Maharashtra"
    },
    "manipur": {
      "code": "mn",
      "name": "Manipur"
    },
    "meghalaya": {
      "code": "ml",
      "name": "Meghalaya"
    },
    "mizoram": {
      "code": "mz",
      "name": "Mizoram"
    },
    "nagaland": {
      "code": "nl",
      "name": "Nagaland"
    },
    "odisha": {
      "code": "od",
      "name": "Odisha"
    },
    "puducherry": {
      "code": "py",
      "name": "Puducherry"
    },
    "punjab": {
      "code": "pb",
      "name": "Punjab"
    },
    "rajasthan": {
      "code": "rj",
      "name": "Rajasthan"
    },
    "sikkim": {
      "code": "sk",
      "name": "Sikkim"
    },
    "tamilnadu": {
      "code": "tn",
      "name": "Tamil Nadu"
    },
    "telangana": {
      "code": "ts",
      "name": "Telangana"
    },
    "tripura": {
      "code": "tr",
      "name": "Tripura"
    },
    "uttarpradesh": {
      "code": "up",
      "name": "Uttar Pradesh"
    },
    "uttarakhand": {
      "code": "uk",
      "name": "Uttarakhand"
    },
    "westbengal": {
      "code": "wb",
      "name": "West Bengal"
    }
  };
  @override
  Widget build(BuildContext context) {

    List<StateModel> statesList = statesData.entries
        .map((entry) => StateModel.fromJson(entry.value))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('listing here'),
      ),
      body: ListView.builder(
        itemCount: statesList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(statesList[index].name),
            subtitle: Text(" Code:- "+statesList[index].code +" And Name:- "+ statesList[index].name),
            onTap: () {
              // Handle onTap event
            },
          );
        },
      ),
    );
  }
}