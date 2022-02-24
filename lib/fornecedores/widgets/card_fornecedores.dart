import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/views/fornecedor_detalhes.dart';

class CardFornecedor extends StatelessWidget {
  const CardFornecedor({
    Key? key,
    required this.fornecedor,
  }) : super(key: key);

  final List<FornecedorModel> fornecedor;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: fornecedor.length,
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
                            DetalhesFornecedor(fornecedor: fornecedor[index])));
                      },
                      child: Container(
                        width: 250,
                        child: Column(children: [
                          ListTile(
                            title: Text(fornecedor[index].companyName, style: const TextStyle(fontSize: 24.0)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.person),
                                Text(fornecedor[index].contactName),],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8.0,),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone),
                                Text(fornecedor[index].phone),],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.place),
                                Text(fornecedor[index].city + '-' + fornecedor[index].country),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.print, size: 20.0),
                                Text(fornecedor[index].fax ?? ' -- '),],
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