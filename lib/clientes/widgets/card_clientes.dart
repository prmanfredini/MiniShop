import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/views/cliente_edit.dart';

class CardCliente extends StatelessWidget {
  final ClienteModel cliente;

  const CardCliente(this.cliente, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, right: 48, top: 24),
      child: Card(
          //clipBehavior: Clip.antiAlias,
          child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DetalhesCliente(cliente: cliente)));
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 137,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(cliente.firstName + ' ' + cliente.lastName,
                          style: const TextStyle(fontSize: 24.0)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 20.0,
                      ),
                      Text(cliente.phone),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(4)),
                  Row(
                    children: [
                      const Icon(
                        Icons.place,
                        size: 20.0,
                      ),
                      Text(cliente.city + '-' + (cliente.country ?? '')),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
