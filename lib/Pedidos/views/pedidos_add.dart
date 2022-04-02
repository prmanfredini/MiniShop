import 'package:flutter/material.dart';
import 'package:flutter_pr/Pedidos/bloc/pedidos_bloc.dart';
import 'package:flutter_pr/components/appbar.dart';
import 'package:flutter_pr/components/drawer_builder.dart';
import 'package:flutter_pr/components/form_number.dart';

class AddPedido extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _controllerCustomerId = TextEditingController();
  final _controllerOrderNumber = TextEditingController();
  final _controllerProductId = TextEditingController();
  final _controllerQuantity = TextEditingController();
  final label = 'Novo pedido';
  final _key = GlobalKey<FormState>();

  AddPedido({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).secondaryHeaderColor,
      extendBody: true,
      appBar: appBarBuilder(label, _scaffoldKey),
      drawer: DrawerBuilder(context),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
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
                                const Divider(),
                                FormNumber(_controllerOrderNumber,
                                    'Número do pedido'),
                                const Divider(),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 2,
                                        child: FormNumber(
                                            _controllerProductId,
                                            'Id do Produto')),
                                    const Padding(padding: EdgeInsets.all(8)),
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
                ),
              ),
              SizedBox(
                width: 120,
                child: ElevatedButton(
                  onPressed: () {

                    PedidosBloc().salvarPedido(
                        _controllerCustomerId.text,
                        _controllerOrderNumber.text,
                        _controllerProductId.text,
                        _controllerQuantity.text,
                        _key,
                        context);
                  },
                  child: const Text('Salvar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
