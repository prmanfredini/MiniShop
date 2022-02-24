import 'package:flutter/material.dart';
import 'package:flutter_pr/clientes/models/cliente.dart';
import 'package:flutter_pr/clientes/views/cliente_detalhes.dart';

class CardCliente extends StatelessWidget {
  const CardCliente({
    Key? key,
    required this.cliente,
  }) : super(key: key);

  final List<ClienteModel> cliente;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cliente.length,
      scrollDirection: Axis.vertical,
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
                clipBehavior: Clip.antiAlias,
                child: Material(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) =>
                          DetalhesCliente(cliente: cliente[index])));
                    },
                    child: Container(
                      width: 250,
                      child: Column(children: [
                        ListTile(
                          title: Text(cliente[index].firstName + ' ' + cliente[index].lastName, style: const TextStyle(fontSize: 24.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.phone, size: 20.0,),
                              Text(cliente[index].phone),],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.place, size: 20.0,),
                              Text(cliente[index].city + '-' + cliente[index].country),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ),
                ))
          ],
        );}

    );
  }
}