import 'package:flutter/material.dart';
import 'package:flutter_pr/fornecedores/models/fornecedor.dart';
import 'package:flutter_pr/fornecedores/views/fornecedor_edit.dart';

class CardFornecedor extends StatelessWidget {
  final Fornecedor fornecedor;

  const CardFornecedor(this.fornecedor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48.0, right: 48, top: 24),
      child: Card(
          clipBehavior: Clip.antiAlias,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            EditarFornecedor(fornecedor: fornecedor)));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width - 137,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(fornecedor.companyName,
                                    style: const TextStyle(fontSize: 24.0)))),
                        const Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            const Icon(Icons.person),
                            Text(fornecedor.contactName)
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            const Icon(Icons.phone),
                            Text(fornecedor.phone)
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            const Icon(Icons.place),
                            SizedBox(
                                width: 200,
                                child: Text(fornecedor.city +
                                    '-' +
                                    fornecedor.country)),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                        Row(
                          children: [
                            const Icon(Icons.print, size: 20.0),
                            Text(fornecedor.fax ?? ' -- '),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.all(4)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
