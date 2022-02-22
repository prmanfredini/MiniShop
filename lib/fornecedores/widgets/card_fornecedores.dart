import 'package:flutter/material.dart';

class Card_Fornecedores extends StatelessWidget {
  const Card_Fornecedores({
    Key? key,
    required String companyName,
    required String contactName,
    required String contactTitle,
    required String place,
    required String fax,
    required String phone,
  })  :
        _companyName = companyName,
        _contactName = contactName,
        _contactTitle = contactTitle,
        _place = place,
        _fax = fax,
        _phone = phone,
        super(key: key);

  final String _companyName;
  final String _contactName;
  final String _contactTitle;
  final String _place;
  final String _fax;
  final String _phone;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _companyName,
              style: const TextStyle(fontSize: 22.0),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(Icons.person),
                Text(_contactName),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(Icons.phone),
                Text(_phone),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(Icons.place),
                Text(_place),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: GestureDetector(
              child: Container(
                  alignment: Alignment.bottomRight, child: Icon(Icons.edit)),
              onTap: () {},
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    );
  }
}
