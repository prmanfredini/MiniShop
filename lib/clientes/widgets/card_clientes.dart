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
    return Column(
      children: [
        Container(
          height: 2.0
        ),
        Container(
          height: 150,
          child: Card(
            semanticContainer: true,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, left: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        _title,
                        style: const TextStyle(fontSize: 22.0),
                      ),
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
                        alignment: Alignment.bottomRight,
                        child: Icon(Icons.edit)),
                    onTap: () {},
                  ),
                ),
              ],
            ),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          ),
        ),
      ],
    );
  }
}
