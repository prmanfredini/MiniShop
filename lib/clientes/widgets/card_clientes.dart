import 'package:flutter/material.dart';

class Card_Clientes extends StatelessWidget {
  const Card_Clientes({
    Key? key,
    required String title,
    required String phone,
    required String place,
  }) : _title = title, _phone = phone, _place = place, super(key: key);

  final String _title;
  final String _phone;
  final String _place;

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              _title,
              style: const TextStyle(fontSize: 22.0),
              textAlign: TextAlign.start,
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
                  alignment: Alignment.bottomRight,
                  child: Icon(Icons.edit)),
              onTap: () {},
            ),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    );
  }
}
