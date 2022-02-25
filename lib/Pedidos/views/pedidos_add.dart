import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_numberOnly.dart';
import 'package:flutter_pr/components/form_text.dart';

class AddPedido extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var _controllerCustomerId = TextEditingController();
  var _controllerOrderNumber = TextEditingController();
  var _controllerProductId = TextEditingController();
  var _controllerQuantity = TextEditingController();

  var label = 'Novo pedido';
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: AppBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SafeArea(
        child: SingleChildScrollView(
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
                          color: Theme.of(context).primaryColor,
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
                                      FormNumber(_controllerCustomerId,
                                          'Id do Comprador'),
                                      Divider(),
                                      FormNumber(_controllerOrderNumber,
                                          'Número do pedido'),
                                      Divider(),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 2,
                                              child: FormNumber(
                                                  _controllerProductId,
                                                  'Id do Produto')),
                                          Padding(padding: EdgeInsets.all(8)),
                                          Expanded(
                                              flex: 2,
                                              child: FormNumber(_controllerQuantity,
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
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    //clienteService().cadastrarCliente(cliente);
                  },
                  child: Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
