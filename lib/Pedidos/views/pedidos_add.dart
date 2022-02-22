import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_text.dart';

class AddPedido extends StatelessWidget {

  var _controllerCustomerId = TextEditingController();
  var _controllerOrderNumber = TextEditingController();
  var _controllerProductId = TextEditingController();
  var _controllerQuantity = TextEditingController();

  var label = 'Novo pedido';
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        extendBody: true,
        appBar: AppBarBuilder(label),
        drawer: DrawerBuilder(context),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 4 / 3.5,
                    ),
                    physics: const ScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: Container(
                          color: Colors.purple[300],
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Form(
                                  key: _key,
                                  child: Column(
                                    children: [
                                      FormText(_controllerCustomerId, 'Id do Comprador'),
                                      Divider(),
                                      FormText(_controllerOrderNumber, 'Número do pedido'),
                                      Divider(),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child:
                                              FormText(_controllerProductId, 'Id do Produto')),
                                          Padding(padding: EdgeInsets.all(8)),
                                          Expanded(
                                              flex: 2,
                                              child: FormText(_controllerQuantity,
                                                  'Quantidade:')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                  width: 340,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                      //clienteService().cadastrarCliente(cliente);
                    },
                    label: Text('Salvar'),
                    icon: Icon(Icons.add),
                  )),
            ],
          ),
        ),
    );
  }
}
